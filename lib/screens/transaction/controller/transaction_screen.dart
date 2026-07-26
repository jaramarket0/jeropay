import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:jeropay/screens/wallet_history/models/models.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;
import 'package:jeropay/config/app_toast.dart';

class TransactionScreenController extends GetxController {
  // Define any variables or methods needed for the TransactionScreenController
  // For example, you might want to manage the state of transactions here

  @override
  void onInit() {
    super.onInit();
    // Initialize any data or state when the controller is created
    transactions();
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

  ApiService apiService = ApiService(Duration(seconds: 60 * 5));
  List<Data> transactionList = <Data>[].obs;
  RxBool isLoading = false.obs;
  TransactionModel transactionModel = TransactionModel();

  void transactions() async {
    isLoading.value = true;
    try {
      var response = await apiService.fetchTransaction();
      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        //   Get.snackbar('Success', 'Data Purchase Successful',
        // backgroundColor: Colors.green,
        // snackPosition: SnackPosition.BOTTOM,
        // duration: Duration(seconds: 5)
        // );
        transactionModel = transactionModelFromJson(response.body);
        transactionList = transactionModel.data!;
      }
    } catch (e) {
      isLoading.value = false;
      OverlayLoadingProgress.stop();
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      isLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }
}
