import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_toast.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;

class EditUserController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phonrNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var isLoading = false.obs;

  Future<void> updateProfile() async {
    isLoading.value = true;
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
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
      var response = await apiService.editUserProfile({
        'fullName': fullNameController.text,
        'phone': phonrNumberController.text,
        'location': addressController.text,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast.success('Profile Updated Successfully');
        Get.back(result: true);
      } else {
        var res = jsonDecode(response.body);
        AppToast.error(res.toString());
      }
    } catch (e) {
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      isLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }
}