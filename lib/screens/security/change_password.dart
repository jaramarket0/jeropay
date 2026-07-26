import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/signup_screen/controller/signup_controller.dart';
import 'package:jeropay/config/app_toast.dart';

SignupController controller = Get.put(SignupController());

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: currentPasswordController,
            decoration: InputDecoration(
              labelText: 'Current Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: newPasswordController,
            decoration: InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Confirm New Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle password change
              if (newPasswordController.text ==
                  confirmPasswordController.text) {

                    controller.updatePassword(currentPasswordController.text, newPasswordController.text);

              } else {
AppToast.error('Password does not match!!!');
              }
            },
            child: Text('Change Password'),
          ),
        ],
      ),
    );
  }
}
