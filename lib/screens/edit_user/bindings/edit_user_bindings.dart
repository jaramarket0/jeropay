import 'package:get/get.dart';
import 'package:jeropay/screens/edit_user/controller/edit_user_controller.dart';

class EditUserBindings extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<EditUserController>(() => EditUserController());
  }
  
}