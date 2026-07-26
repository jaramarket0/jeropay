import 'package:get/get.dart';
import 'package:jeropay/screens/edu_pins_screen/controller/edu_pins_controller.dart';

class EduPinsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EduPinsController>(() => EduPinsController());
  }
  
}