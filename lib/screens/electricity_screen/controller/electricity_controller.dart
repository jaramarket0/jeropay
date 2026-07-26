import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/electricity_screen/confirmation.dart';
import 'package:jeropay/screens/electricity_screen/electricity_receipt_screen.dart';
import 'package:jeropay/screens/electricity_screen/model/model.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/services/api_service.dart';
import 'dart:developer' as myLog;

import 'package:overlay_kit/overlay_kit.dart';
import 'package:jeropay/config/app_toast.dart';

HomeScreenController homeScreenController = Get.find<HomeScreenController>();

class ElectricityController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));
  TextEditingController amountController = TextEditingController();
  TextEditingController meterController = TextEditingController();
  RxBool next = false.obs;
  ValidationModel validationModel = ValidationModel(
    status: '',
    name: '',
    message: '',
    customerAddress: '',
    outstandingAnount: '',
  );

  ElectricityPurchaseModel electricityPurchaseModel =
      ElectricityPurchaseModel();

  String? selectedNetwork;

  RxString? phone = ''.obs;

  String? selectedString;

  String? selectedMeterType;

  void setPhone() async {
    var phone1 = await dataBase.getPhone();
    phone!.value = phone1;
  }

  Map<String, String> electricityImageMap = <String, String>{
    'Abuja Electricity': 'assets/images/AEDC.png',
    'Benin Electricity': 'assets/images/EEDC.png',
    'Eko Electricity': 'assets/images/EKEDC.png',
    'Enugu Electricity': 'assets/images/IBEDC.png',
    'Ibadan Electricity': 'assets/images/JED.png',
    'Ikeja Electricity': 'assets/images/KAEDCO (1).png',
    'Port Harcourt': 'assets/images/PHED.png',
    'Yola Electricity': 'assets/images/YEDC.png',
    'Kaduna Electricity': 'assets/images/KEDC.png',
    'Kano Electricity': 'assets/images/KEDC.png',
    'Jos Electricity': 'assets/images/JEDC.png',
    'Lagos Electricity': 'assets/images/LED.png',
    'Ogun Electricity': 'assets/images/OEDC.png',
    'Osun Electricity': 'assets/images/OEDC.png',
    'Rivers Electricity': 'assets/images/PHED.png',
    'Yobe Electricity': 'assets/images/YEDC.png',
    'Zamfara Electricity': 'assets/images/ZEDC.png',
  };

  @override
  void onInit() {
    super.onInit();
    setPhone();
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    meterController.dispose();
  }

  void validateElectricity() async {
    next.value = true;

    final data = {
      "meter_number": "25114019265",
      "meter_type": "prepaid",
      "disco": "Port Harcourt",
    };

    // myLog.log(meterController.text);
    // myLog.log(selectedMeterType!.toLowerCase());
    // myLog.log(amountController.text);
    // myLog.log(selectedString!);

    try {
      var response = await apiService.validateElectricity(data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        next.value = false;
        validationModel = validationModelFromJson(response.body);
        Get.to(
          () => ConfirmationScreen(
            image: electricityImageMap[selectedString],
            to: selectedString,
            amount: amountController.text,
            network: meterController.text,
            description: selectedMeterType,
            validationModel: validationModel,
          ),
        );
      }
    } catch (e) {
      next.value = false;
      myLog.log(e.toString());
    } finally {
      next.value = false;
    }
    // await Future.delayed(Duration(seconds: 5));
    // // OverlayLoadingProgress.stop();
    // next.value = false;
  }

  void purchaseElectricity() async {
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
    final data = {
      "meter_number": meterController.text,
      "meter_type": selectedMeterType!.toLowerCase(),
      "disco": selectedString,
      "amount": amountController.text,
      "phone": phone!.value ?? '08012345678',
      "bypass": true,
    };

    //myLog.log(data.toString());
    try {
      var response = await apiService.purchaseElectricity(data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();

        electricityPurchaseModel = electricityPurchaseModelFromJson(
          response.body,
        );
        homeScreenController.dashboard();
        String image = electricityImageMap[selectedString]!;
        Navigator.of(Get.context!).push(
          CupertinoPageRoute(
            builder:
                (context) => ElectricityReceiptScreen(
                  networkImage: image,
                  electricityPurchaseModel: electricityPurchaseModel,
                  networkName: selectedString!,
                ),
          ),
        );
      }else{
        var res = jsonDecode(response.body);
        AppToast.error('something went wrong: ${res['message']} - contact admin');
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      myLog.log(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }

    // await Future.delayed(Duration(seconds: 5));
    // OverlayLoadingProgress.stop();
  }
}
