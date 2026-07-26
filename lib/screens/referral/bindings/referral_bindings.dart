import 'package:get/get.dart';
import 'package:jeropay/screens/referral/controller/referral_controller.dart';

class ReferralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferralController>(() => ReferralController());
  }
  
}