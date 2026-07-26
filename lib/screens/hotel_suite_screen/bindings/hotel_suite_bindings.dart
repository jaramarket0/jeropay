import 'package:get/get.dart';
import 'package:jeropay/screens/hotel_suite_screen/controller/hotel_suite_controller.dart';

class HotelSuiteBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelSuiteController>(() => HotelSuiteController());
  }
  
}