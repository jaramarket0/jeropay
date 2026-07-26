import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/airtime/airtime_receipt_screen.dart';
import 'package:jeropay/screens/airtime/models/models.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;
import 'package:jeropay/config/app_toast.dart';

HomeScreenController homeScreenController = Get.find<HomeScreenController>();
class AirtimeController extends GetxController {
  // Add your properties and methods here
  var data = [].obs; // Example observable list
  String? selectedNetwork;

  final Map<String, String> networkImage = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9MOBILE': 'assets/images/9mobile.png',
  };
  AirtimePurchaseModel airtimePurchaseModel = AirtimePurchaseModel();
  String? selectedString;
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  void fetchData() {
    // Logic to fetch data
    data.value = ['Item 1', 'Item 2', 'Item 3']; // Example data
  }

  @override
  void onInit() {
    super.onInit();
    // fetchData(); // Fetch data when the controller is initialized
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    amountController.dispose();
  }

  void purchaseAirtime() async {
    myLog.log(selectedNetwork!);
    myLog.log(selectedString!);
    myLog.log(phoneController.text);
    myLog.log(amountController.text);
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
    // await Future.delayed(Duration(seconds: 5));
    //  OverlayLoadingProgress.stop();
    Map<String, dynamic> data = {
      "network": selectedNetwork,
      "phone_number": phoneController.text,
      "bypass": false,
      "request-id": "",
      "plan_type": "VTU",
      "amount": amountController.text,
    };
    try {
      var response = await apiService.purchaseAirtime(data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        homeScreenController.dashboard();
        String image = networkImage[selectedNetwork!.toUpperCase()]!;
        airtimePurchaseModel = airtimePurchaseModelFromJson(response.body);
        Navigator.of(Get.context!).push(
          CupertinoPageRoute(
            builder:
                (context) => AirtimeReceiptScreen(
                  networkImage: image,
                  airtimePurchaseModel: airtimePurchaseModel,
                  networkName: selectedNetwork!,
                ),
          ),
        );

        AppToast.success('Purchase Sucessfull');
      }
    } catch (e) {
      AppToast.error(e.toString());
      myLog.log(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
