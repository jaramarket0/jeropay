import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';

HomeScreenController controller = Get.find<HomeScreenController>();

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {

bool isPushNotificationEnabled = false;
bool isEmailNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings',style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),),
                centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(CupertinoIcons.bell,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Biometric',
                      style: kEncodeSansSemiBold.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                        fontSize: SizeConfig.blockSizeVertical! * 2,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Activate face ID \nor fingerprint.',
                        style: kEncodeSansSmall.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //Icon(Icons.chevron_right_rounded),
                Switch(value: isPushNotificationEnabled, onChanged: (value) {
                  // Handle switch toggle
                  setState(() {
                    isPushNotificationEnabled = value;
                  });
                }),
              ],
            ),
            SizedBox(height: sizeVertical * 2,),
             Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(CupertinoIcons.mail,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hide wallet Balance',
                      style: kEncodeSansSemiBold.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                        fontSize: SizeConfig.blockSizeVertical! * 2,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Hide or Show wallet balance.',
                        style: kEncodeSansSmall.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //Icon(Icons.chevron_right_rounded)
                Switch(value: controller.isHide.value, onChanged: (value) {
                  // Handle switch toggle
                  setState(() {
                    controller.isHide.value = value;
                  });
                }),
              ],
            ),
          ]
        )
      ),
    );
  }
}