import 'package:get/get.dart';
import 'package:jeropay/screens/signin/controller/signin_controller.dart';

class SigninBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}
