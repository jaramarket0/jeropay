import 'package:get/get.dart';
import 'package:jeropay/screens/cable_screen/controller/cable_controller.dart';

class CableBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CableController>(() => CableController());
  }
  
}