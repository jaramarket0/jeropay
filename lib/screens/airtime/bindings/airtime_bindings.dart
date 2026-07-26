import 'package:get/get.dart';
import 'package:jeropay/screens/airtime/controller/airtime_controller.dart';


class AirtimeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AirtimeController>(() => AirtimeController());
  }
}
