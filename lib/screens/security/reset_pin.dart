import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/signup_screen/controller/signup_controller.dart';

SignupController controller = Get.put(SignupController());

class ResetPin extends StatefulWidget {
  const ResetPin({super.key});

  @override
  State<ResetPin> createState() => _ResetPinState();
}

class _ResetPinState extends State<ResetPin> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  bool isObscured = true;
  bool isObscured1 = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset PIN',
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
            controller: passwordController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon:
                    isObscured
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
              ),
              labelText: 'Current Password',
              border: OutlineInputBorder(),
            ),
            obscureText: isObscured,
          ),
          SizedBox(height: 16.0),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 5,
            controller: pinController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon:
                    isObscured1
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isObscured1 = !isObscured1;
                  });
                },
              ),
              labelText: 'New Pin',
              border: OutlineInputBorder(),
            ),
            obscureText: isObscured1,
          ),
          // SizedBox(height: 16.0),
          // TextField(
          //   decoration: InputDecoration(
          //     labelText: 'Confirm New Password',
          //     border: OutlineInputBorder(),
          //   ),
          //   obscureText: true,
          // ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle password change
              print('object');
              controller.updatePinWithPassword(
                passwordController.text,
                pinController.text,
              );
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
