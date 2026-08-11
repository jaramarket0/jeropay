import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/utils.dart';
import 'package:jeropay/config/ThemeController.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/local_storage.dart';
import 'package:jeropay/config/routes.dart';
import 'package:jeropay/firebase_options.dart';
import 'package:jeropay/screens/signup_screen/controller/signup_controller.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;
import 'package:jeropay/config/app_toast.dart';

final FlutterLocalNotificationsPlugin _localNotifications =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'jeropay_high_importance',
  'JeroPay Notifications',
  description: 'JeroPay important notifications',
  importance: Importance.high,
  playSound: true,
  enableVibration: true,
  enableLights: true,
);

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FCM background handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialise local notifications. iOS/macOS permission flags are disabled
  // here because FirebaseMessaging.requestPermission() (called later, off
  // the startup path) is the single source of truth for the native prompt —
  // otherwise iOS asks for notification permission twice.
  await _localNotifications.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    ),
  );
  await _localNotifications
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(_channel);

  // Show native banner when app is in the foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    }
  });

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  DataBase dataBase = Get.put(DataBase());
  SignupController signupController = Get.put(SignupController());
  Get.put(ThemeController());
  var token = await dataBase.getToken();
  var pin = await dataBase.getTransactionPin();

  String initialRoute = (token.isNotEmpty && pin.isNotEmpty) ? '/app_security_screen' : (token.isNotEmpty && pin.isEmpty) ? '/transaction_pin_screen' : '/splash_screen';
  runApp(MyApp(initialRoute:initialRoute));

  // FCM permission request + token fetch run in the background after
  // runApp() fires. On iOS, requestPermission() shows a blocking native
  // dialog and getToken() makes a network call that can hang — neither may
  // ever await before runApp() or first-frame render stalls behind them.
  unawaited(_setupFcmInBackground(isLoggedIn: token.isNotEmpty));
}

Future<void> _setupFcmInBackground({required bool isLoggedIn}) async {
  try {
    final fcm = FirebaseMessaging.instance;

    final settings = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    await fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    if (isLoggedIn &&
        (settings.authorizationStatus == AuthorizationStatus.authorized ||
            settings.authorizationStatus == AuthorizationStatus.provisional)) {
      await _registerFcmToken();
    }

    fcm.onTokenRefresh.listen((newToken) {
      myLog.log('fcm token refreshed: $newToken');
      final api = ApiService(const Duration(seconds: 15));
      api.registerFcmToken(newToken);
    });
  } catch (e) {
    myLog.log('FCM setup error: $e');
  }
}

Future<void> _registerFcmToken() async {
  try {
    final fcm = FirebaseMessaging.instance;
    String? fcmToken;

    // On iOS, getToken() can fail/hang if the APNS token isn't set yet
    // (common on the simulator or early in launch) — skip until it is.
    if (!kIsWeb && Platform.isIOS && await fcm.getAPNSToken() == null) {
      myLog.log('APNS token not yet available; skipping FCM token fetch.');
    } else {
      fcmToken = await fcm
          .getToken()
          .timeout(const Duration(seconds: 20), onTimeout: () => null);
    }

    if (fcmToken != null) {
      myLog.log('fcm token: $fcmToken');
      final api = ApiService(const Duration(seconds: 15));
      await api.registerFcmToken(fcmToken);
    }
  } catch (e) {
    myLog.log('fcm token registration error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});
final String initialRoute;
  // @override
  // State<MyApp> createState() => _MyAppState();


// class _MyAppState extends State<MyApp> {
//   final ThemeProvider _themeProvider = ThemeProvider();

//    @override
//   void initState() {
//     super.initState();
//     _themeProvider.loadThemeMode();
//     _themeProvider.addListener(() {
//       setState(() {});
//     });
//   }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (themeController) {
        return OverlayKit(
          child: GetMaterialApp(
            title: 'JeroPay',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode,
            initialRoute: initialRoute,
            getPages: AppRoutes.pages,
          ),
        );
      },
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
