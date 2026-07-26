
import 'package:get/get.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
