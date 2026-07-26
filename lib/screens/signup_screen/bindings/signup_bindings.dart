import 'package:get/get.dart';
import 'package:jeropay/screens/signup_screen/controller/signup_controller.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
  
}