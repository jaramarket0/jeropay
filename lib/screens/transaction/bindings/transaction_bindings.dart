import 'package:get/get.dart';
import 'package:jeropay/screens/transaction/controller/transaction_screen.dart';


class TransactionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionScreenController>(() => TransactionScreenController());
  }
}
