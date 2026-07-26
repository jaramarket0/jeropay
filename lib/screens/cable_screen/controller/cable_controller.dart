import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/cable_screen/cable_receipt_screen.dart';
import 'package:jeropay/screens/cable_screen/confirmation.dart';
import 'package:jeropay/screens/cable_screen/models/models.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/services/api_service.dart';
import 'dart:developer' as myLog;

import 'package:overlay_kit/overlay_kit.dart';
import 'package:jeropay/config/app_toast.dart';

HomeScreenController homeScreenController = Get.find<HomeScreenController>();

class CableController extends GetxController {
  TextEditingController iucNumber = TextEditingController();
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));
  TextEditingController amountController = TextEditingController();

CablePurchaseModel cablePurchaseModel = CablePurchaseModel();

  ValidationModel validationModel = ValidationModel(
    status: '',
    name: '',
    message: '',
    outstandingAnount: '',
  );
  List<CableModel> cablePriceList = <CableModel>[];
  @override
  void onInit() {
    super.onInit();
    // Initialize any data or fetch data if needed
    fetchCable();
  }

  final Map<String, String> networkImage = {
    'DSTV': 'assets/images/dstv.png',
    'GOTV': 'assets/images/gotv.png',
    'STARTIMES': 'assets/images/image copy.png',
  };

  RxBool next = false.obs;
  RxBool isLoading = false.obs;
  String? selectedCable;
  String? selectedString;
  String? cableId;

final Map<String, String> cableImage = {
    'DSTV': 'assets/images/dstv.png',
    'GOTV': 'assets/images/gotv.png',
    'STARTIMES': 'assets/images/image copy.png',
  };

  @override
  void dispose() {
    super.dispose();
    iucNumber.dispose();
    amountController.dispose();
  }

  void fetchCable() async {
    isLoading.value = true;
    try {
      var response = await apiService.cableSubPrice();

      if (response.statusCode == 200) {
        isLoading.value = false;
        //myLog.log(response.body);
        //cablePriceList = cableModelFromJson(response.body);
        final jsonResponse = json.decode(response.body);
        cablePriceList =
            (jsonResponse as List)
                .map((planJson) => CableModel.fromJson(planJson))
                .toList();
      }
    } catch (e) {
      myLog.log(e.toString());
      isLoading.value = false;
      AppToast.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void validateCable() async {
    next.value = true;
    final data = {"iuc": iucNumber.text, "cable_provider": selectedCable};
    try {
      var response = await apiService.validateCable(data);
      // myLog.log(data.toString());
      // myLog.log(selectedString.toString());
      // myLog.log(selectedCable.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        next.value = false;
        validationModel = validationModelFromJson(response.body);
        myLog.log(validationModel.status);
        myLog.log(validationModel.name);
        myLog.log(validationModel.message);
        myLog.log(validationModel.outstandingAnount);

        Get.to(
          () => ConfirmationScreen(
            image: networkImage[selectedCable!].toString(),
            to: iucNumber.text,
            amount: amountController.text,
            network: selectedCable!,
            description: selectedString ?? 'GOTv Joli',
            validationModel: validationModel,
          ),
        );
      }
    } on SocketException {
      myLog.log('message');
      AppToast.error("Check Inter Connection and try again");
    } catch (e) {
      next.value = false;
      myLog.log(e.toString());
      AppToast.error("Something went wrong: ${e.toString()}");
    } finally {
      next.value = false;
    }
  }

  void purchaseCableSub() async {
    OverlayLoadingProgress.start(circularProgressColor: Color(0xff5f2e96), 
//gifOrImagePath: 'assets/images/logo-1.png', 
widget: Container(
  width: MediaQuery.of(Get.context!).size.width / 4,
  padding: EdgeInsets.all(MediaQuery.of(Get.context!).size.width / 13,),
  child: AspectRatio(aspectRatio: 1,
  child: Stack(children:[
    SizedBox(
      width: 80,
      height: 80,
      child: CircularProgressIndicator()),
    Image.asset('assets/images/logo-1.png',
    width: 40,
    height: 40,
    )
  ] )),
));

final data = {
"iuc": iucNumber.text,
"cable_provider": selectedCable
};

var response = await apiService.purchaseCable(cableId!,data);

try{
if(response.statusCode == 200 || response.statusCode == 201){
  homeScreenController.dashboard();
  myLog.log(response.body);
  OverlayLoadingProgress.stop();
  cablePurchaseModel = cablePurchaseModelFromJson(response.body);
String image = cableImage[selectedCable]!;
  Navigator.of(Get.context!).push(
          CupertinoPageRoute(
            builder:
                (context) => CableReceiptScreen(
                  networkImage: image,
                  cablePurchaseModel: cablePurchaseModel,
                  networkName: selectedCable!,
                ),
          ),
        );

}else{
  var res = jsonDecode(response.body);
  AppToast.error("Something went wrong: ${(res)['message']} - contact admin");
}
// else if(response.statusCode == 400){
//   myLog.log(jsonDecode(response.body)['messagae']);
//   Get.snackbar(
//         'Error',
//         "Something went wrong: ${jsonDecode(response.body)['message']}",
//         overlayColor: Colors.redAccent,
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 5),
//       );
// }
}catch(e){
myLog.log(e.toString());
  AppToast.error("Something went wrong: ${e.toString()}");
}finally{
OverlayLoadingProgress.stop();
}

// myLog.log(data.toString());
// myLog.log(cableId!);
// await Future.delayed(Duration(seconds: 5));
// OverlayLoadingProgress.stop();
  }
}
