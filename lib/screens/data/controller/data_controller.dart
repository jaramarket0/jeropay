import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/data/data_receipt_screen.dart';
import 'package:jeropay/screens/data/models/model.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;
import 'package:jeropay/config/app_toast.dart';

HomeScreenController homeScreenController = Get.find<HomeScreenController>();

class DataController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));
  DataPurchaseModel dataPurchaseModel = DataPurchaseModel();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  String? selectedNetwork;
  String? selectedString;

  final Map<String, String> networkImage = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9MOBILE': 'assets/images/9mobile.png',
  };

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    amountController.dispose();
  }

  void purchaseData(String dataId) async {
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
      var response = await apiService.purchaseData(
        dataId,
        phoneController.text,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        dataPurchaseModel = dataPurchaseModelFromJson(response.body);
// Get.to(()=> DataReceiptScreen(
//   networkImage: networkImage[selectedNetwork]!,
//   networkName: selectedNetwork!,
//   dataPurchaseModel: dataPurchaseModel,
// ));
//         Get.snackbar(
//           'Error',
//           'Data Purchase Successful',
//           backgroundColor: Colors.greenAccent,
//           duration: Duration(seconds: 5),
//           snackPosition: SnackPosition.BOTTOM,
//         );
homeScreenController.dashboard();
        String image = networkImage[selectedNetwork]!;
        Navigator.of(Get.context!).push(
          CupertinoPageRoute(
            builder:
                (context) => DataReceiptScreen(
                  networkImage: image,
                  dataPurchaseModel: dataPurchaseModel,
                  networkName: selectedNetwork!,
                ),
          ),
        );
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
