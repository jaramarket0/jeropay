import 'package:get/get.dart';
import 'package:jeropay/screens/account/controller/account_controller.dart';

class AccountBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
