import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:jeropay/config/app_toast.dart';

class AccountController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));

  // Define any variables or methods needed for the AccountController
  // For example, you might want to manage the state of the account screen here

  @override
  void onInit() {
    super.onInit();
    // Initialize any data or state when the controller is created
  }

  @override
  void onReady() {
    super.onReady();
    // Perform actions when the controller is ready
  }

  @override
  void onClose() {
    // Clean up resources when the controller is disposed
    super.onClose();
  }

  void logOut() async {
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
      var response = await apiService.logOut();

      if (response.statusCode == 200) {
        OverlayLoadingProgress.stop();
        dataBase.logOut();
        var status = json.decode(response.body)['status'];
        AppToast.success(status);
        Get.offAllNamed('/signin_screen');
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      AppToast.success(e.toString());
    }finally{
      OverlayLoadingProgress.stop();
    }
  }
}
