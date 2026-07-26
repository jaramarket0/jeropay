import 'package:get/get.dart';
import 'package:jeropay/screens/data/controller/data_controller.dart';

class DataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(() => DataController());
  }
  }
  