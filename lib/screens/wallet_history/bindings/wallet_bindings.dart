import 'package:get/get.dart';
import 'package:jeropay/screens/wallet_history/controller/wallet_controller.dart';

class WalletBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
  }
}
