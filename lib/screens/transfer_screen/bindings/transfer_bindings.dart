import 'package:get/get.dart';
import 'package:jeropay/screens/transfer_screen/controller/transfer_controller.dart';

class TransferBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferController>(() => TransferController());
  }
  
}