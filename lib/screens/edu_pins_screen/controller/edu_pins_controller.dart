import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/edu_pins_screen/edu_pin_receipt_screen.dart';
import 'package:jeropay/screens/edu_pins_screen/models/models.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;
import 'package:jeropay/config/app_toast.dart';

HomeScreenController homeScreenController = Get.find<HomeScreenController>();

class EduPinsController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 5));
  TextEditingController quantityController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  EduPinPurchaseModel eduPinPurchaseModel = EduPinPurchaseModel();
  String? selectedExam;

  final Map<String, String> networkImage = {
    'WEAC': 'assets/images/weac.png',
    'NECO': 'assets/images/neco.png',
    'NABTAB': 'assets/images/nabtab.png',
  };

  void purchaseExamPin() async {
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
      final body = {
        "amount": amountController.text,
        "exam_name": selectedExam,
        "quantity": quantityController.text,
      };
      myLog.log(body.toString());
      // await Future.delayed(Duration(seconds: 5));
      // OverlayLoadingProgress.stop();
      var response = await apiService.purchaseExam(body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
homeScreenController.dashboard();
        eduPinPurchaseModel = eduPinPurchaseModelFromJson(response.body);
        Get.to(
          () => EduPinReceiptScreen(
            networkImage: networkImage[selectedExam]!,
            networkName: selectedExam!,
            dataPurchaseModel: eduPinPurchaseModel,
          ),
        );
        AppToast.success('Data Purchase Successful');
      }else{
        var res = jsonDecode(response.body);
        OverlayLoadingProgress.stop();
      AppToast.error(res['message']);
         myLog.log(res['message']);
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      AppToast.error(e.toString());
      myLog.log(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
