import 'package:get/get.dart';
import 'package:jeropay/screens/electricity_screen/controller/electricity_controller.dart';

class ElectricityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ElectricityController>(() => ElectricityController());
  }
  
}