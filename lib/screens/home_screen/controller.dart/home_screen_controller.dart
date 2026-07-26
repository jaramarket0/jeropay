import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jeropay/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/home_screen/model/models.dart';
import 'dart:developer' as myLog;

import 'package:jeropay/services/api_service.dart';
import 'package:jeropay/config/app_toast.dart';

class HomeScreenController extends GetxController {
  // Define any variables or methods needed for the HomeScreenController
  // For example, you might want to manage the state of the home screen here
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));

  RxBool isLoading = false.obs;
  RxBool isRetrying = false.obs;
  RxBool isHide = false.obs;

  DashboardModel dashboardModel = DashboardModel();
  @override
  void onInit() {
    super.onInit();
    // Initialize any data or state when the controller is created
    dashboard();
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

  void retryVirtualAccounts() async {
    isRetrying.value = true;
    try {
      final response = await apiService.retryVirtualAccounts();
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        final failed = body['failed'] as List? ?? [];
        if (failed.isNotEmpty) {
          final reason = (failed.first['error'] ?? 'Unknown error').toString();
          AppToast.error('Account generation failed: $reason');
          myLog.log(reason.toString());
        } else {
          AppToast.success('Virtual accounts generated!');
          dashboard();
        }
      } else {
        final msg = body['message'] ?? body.toString();
        AppToast.error(msg.toString());
        myLog.log(msg.toString());
      }
    } catch (e) {
      AppToast.error(e.toString());
      myLog.log(e.toString());
    } finally {
      isRetrying.value = false;
    }
  }

  void dashboard() async {
    isLoading.value = true;
    try {
      var response = await apiService.dashboard();
      myLog.log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        dashboardModel = dashboardModelFromJson(response.body);

        // Get.snackbar(
        //   'Success',
        //   'Dashboard data',
        //   colorText: Colors.white,

        //   backgroundColor: Colors.green,
        // );
      }else if (response.statusCode == 403){
Get.offAllNamed('/signin_screen');
      }
    } catch (e) {
      isLoading.value = false;
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
