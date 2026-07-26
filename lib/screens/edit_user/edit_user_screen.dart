import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/edit_user/controller/edit_user_controller.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/widget/button.dart';
import 'package:jeropay/widget/textField.dart';
// import 'package:jeropay/widget/textField1.dart';

HomeScreenController homeController = Get.find<HomeScreenController>();

EditUserController controller = Get.put(EditUserController());

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {

  @override
  void initState() {
    super.initState();
    controller.fullNameController.text = homeController.dashboardModel.data!.name ?? '';
    controller.phonrNumberController.text = homeController.dashboardModel.data!.phone ?? '';
    controller.addressController.text = homeController.dashboardModel.data!.location ?? '';
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 2),
        children: [
          SizedBox(
            height: sizeVertical * 2,
          ),
          textFieldeName(homeController.dashboardModel.data!.name ?? 'Jeropay User','Full Name', controller.fullNameController),
          SizedBox(height: sizeVertical * 2,),
          textFieldPhoneNumber(homeController.dashboardModel.data!.phone ?? 'JeroPay User','Phone', controller.phonrNumberController,),
          SizedBox(height: sizeVertical * 2,),
          textFieldAddress(homeController.dashboardModel.data!.location ?? 'JeroPay User','Address', controller.addressController),
          SizedBox(height: sizeVertical * 2,),
          Obx(() => button(
            text1: 'Submit',
            isLoading1: controller.isLoading.value,
            tap: () async {
              if (controller.isLoading.value) return;
              await controller.updateProfile();
              homeController.dashboard();
            },
          )),
        ],
      ),
    );
  }
}