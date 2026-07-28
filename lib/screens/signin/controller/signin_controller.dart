import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:jeropay/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/screens/signin/models/models.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;
import 'package:jeropay/config/app_toast.dart';

class SigninController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));
  SigninModel signinModel = SigninModel();
  final RxBool isGoogleLoading = false.obs;
  final TextEditingController? userNameController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    userNameController!.dispose();
    passwordController!.dispose();
  }

  void signInWithGoogle() async {
    isGoogleLoading.value = true;
    try {
      // Web needs `clientId` to initialize Google Identity Services;
      // native platforms use `serverClientId` to obtain a server auth code.
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: kIsWeb
            ? '876478177791-bmopjk9ireq1g8eqlus9buml0tcl5l2o.apps.googleusercontent.com'
            : null,
        serverClientId: kIsWeb
            ? null
            : '876478177791-bmopjk9ireq1g8eqlus9buml0tcl5l2o.apps.googleusercontent.com',
      );
      // Do NOT show loader here — the native Google picker is already the UX.
      // Showing an overlay before the native activity causes _dependents.isEmpty crash.
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return; // user cancelled

      _showLoader(); // Safe to show now — Flutter UI is fully back in focus
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final String? idToken = await userCredential.user?.getIdToken();

      if (idToken == null) throw Exception('Failed to get ID token');

      var response = await apiService.googleAuth({'id_token': idToken});
      myLog.log('googleAuth status: ${response.statusCode}');
      myLog.log('googleAuth body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        signinModel = signinModelFromJson(response.body);
        dataBase.saveToken(signinModel.token!);
        dataBase.saveUserName(signinModel.username!);
        dataBase.saveUserId(signinModel.userId!);
        if (signinModel.profile != null) {
          dataBase.saveReferalCode(signinModel.profile!.code ?? '');
          dataBase.saveFullName(signinModel.profile!.fullName ?? '');
          dataBase.savePhoneNumber(signinModel.profile!.phone ?? '');
          dataBase.saveAddress(signinModel.profile!.location ?? '');
        }
        if (signinModel.pin != null) {
          dataBase.saveTransactionPin(signinModel.pin!.pin ?? '');
        }
        final profileComplete = (signinModel.profile?.phone ?? '').isNotEmpty;
        if (!profileComplete) {
          Navigator.of(Get.context!).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (_) => const CompleteProfileScreen()),
            (_) => false,
          );
        } else {
          Get.offAllNamed('/main_screen');
        }
      } else {
        String errorMsg = 'Google sign-in failed (${response.statusCode})';
        try {
          errorMsg = json.decode(response.body)["message"] ?? errorMsg;
        } catch (_) {
          // response is not JSON (HTML error page or empty body)
        }
        _showErrorSnackbar(errorMsg);
      }
    } on PlatformException catch (e) {
      myLog.log('Google Sign-In error: ${e.code}');
      if (e.code == 'sign_in_cancelled') return;
      _showErrorSnackbar('Google sign-in failed. Please try again.');
    } catch (e) {
      myLog.log(e.toString());
      _showErrorSnackbar('Google sign-in failed. Please try again.');
    } finally {
      isGoogleLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }

  void _showErrorSnackbar(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      try {
        if (Get.overlayContext == null) return;
        AppToast.error(message);
      } catch (e) {
        myLog.log('Snackbar error: $e');
      }
    });
  }

  void _showLoader() {
    OverlayLoadingProgress.start(
      circularProgressColor: const Color(0xff5f2e96),
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );
  }

  void loginUser() async {
    OverlayLoadingProgress.start(
      circularProgressColor: const Color(0xff5f2e96),
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );
    try {
      Map<String, dynamic> userData = {
        "username": userNameController!.text,
        "password": passwordController!.text,
      };

      var response = await apiService.login(userData);
      if (response.statusCode == 200 || response.statusCode == 201) {
          userNameController!.clear();
    passwordController!.clear();
        signinModel = signinModelFromJson(response.body);
        dataBase.saveReferalCode(signinModel.profile?.code ?? '');
        dataBase.saveFullName(signinModel.profile?.fullName ?? '');
        dataBase.savePhoneNumber(signinModel.profile?.phone ?? '');
        dataBase.saveAddress(signinModel.profile?.location ?? '');
        dataBase.saveTransactionPin(signinModel.pin?.pin ?? '');
        dataBase.saveToken(signinModel.token!);
        dataBase.saveUserName(signinModel.username!);
        dataBase.saveUserId(signinModel.userId!);

        // Register FCM device token after login
        FirebaseMessaging.instance.getToken().then((fcmToken) {
          if (fcmToken != null) {
            apiService.registerFcmToken(fcmToken).catchError((_) {});
          }
        });

        AppToast.success('Login Successfull');
        Get.offAllNamed('/main_screen');
      }else{
        AppToast.error(json.decode(response.body)["message"]);
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      myLog.log(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
