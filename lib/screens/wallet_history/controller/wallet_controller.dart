import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/wallet_history/models/models.dart';
import 'dart:developer' as myLog;

import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:jeropay/config/app_toast.dart';

class WalletController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));
  RxList<Data> transactionList = <Data>[].obs;
  RxBool isLoading = false.obs;
  TransactionModel transactionModel = TransactionModel();

  @override
  void onInit() {
    super.onInit();
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

  void transactions() async {
    // OverlayLoadingProgress.start(
    //   circularProgressColor: Color(0xff5f2e96),
    //   //gifOrImagePath: 'assets/images/logo-1.png',
    //   widget: Container(
    //     width: MediaQuery.of(Get.context!).size.width / 4,
    //     padding: EdgeInsets.all(MediaQuery.of(Get.context!).size.width / 13),
    //     child: AspectRatio(
    //       aspectRatio: 1,
    //       child: Stack(
    //         children: [
    //           SizedBox(
    //             width: 80,
    //             height: 80,
    //             child: CircularProgressIndicator(),
    //           ),
    //           Image.asset('assets/images/logo-1.png', width: 40, height: 40),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
        transactionList.assignAll(transactionModel.data ?? []);
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
