import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/forget_password_screen/new_password_screen.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:jeropay/config/app_toast.dart';

class ForgetPasswordController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    tokenController.dispose();
  }

  void forgetPassword() async {
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
      //gifOrImagePath: 'assets/images/logo-1.png',
      widget: Container(
        width: MediaQuery.of(Get.context!).size.width / 4,
        padding: EdgeInsets.all(MediaQuery.of(Get.context!).size.width / 13),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(),
              ),
              Image.asset('assets/images/logo-1.png', width: 40, height: 40),
            ],
          ),
        ),
      ),
    );

    try {
      Map<String, dynamic> customerData = {'email': emailController.text};

      var response = await apiService.resetPassword(customerData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        Get.to(() => NewPasswordScreen());
        AppToast.success('Check Your Email');
      }else if (response.statusCode == 400){
        OverlayLoadingProgress.stop();
        AppToast.error(json.decode(response.body)['email'][0]);
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }







  void newPassword() async {
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
      //gifOrImagePath: 'assets/images/logo-1.png',
      widget: Container(
        width: MediaQuery.of(Get.context!).size.width / 4,
        padding: EdgeInsets.all(MediaQuery.of(Get.context!).size.width / 13),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(),
              ),
              Image.asset('assets/images/logo-1.png', width: 40, height: 40),
            ],
          ),
        ),
      ),
    );

    try {
      Map<String, dynamic> customerData = {
         "password": passwordController.text,
          "token": tokenController.text,
        };

      var response = await apiService.newPassword(customerData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        AppToast.success('Password Reset Successfully');
        Get.offAllNamed('/signup_screen');
      }else{
        OverlayLoadingProgress.stop();
        final body = json.decode(response.body);
        AppToast.error(body is Map ? body.values.first.toString() : body.toString());
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
