import 'package:get/get.dart';
import 'package:jeropay/screens/bulk_sms_screen/controller/bulk_sms_controller.dart';

class BulkSmsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BulkSmsController>(() => BulkSmsController());
  }

  
}