// import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/forget_password_screen/controller/forget_password_controller.dart';
import 'package:jeropay/widget/textField.dart';
import 'package:jeropay/config/app_toast.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late ForgetPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ForgetPasswordController());
  }
  final RegExp nameExp = RegExp(r'^[A-Za-z]+$');
  final RegExp usernameExp = RegExp(r'^[a-zA-Z0-9*\-_@/\\]+$');
  bool _firstNameInputIsValid = true;
  bool _lastNameInputIsValid = true;
  bool _usernameInputIsValid = true;
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  // bool _numberInputIsValid = true;
  bool _isCheck = false;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    controller.emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: kEncodeSansBold.copyWith(
            color: kBlack,
            fontSize: SizeConfig.blockSizeHorizontal! * 3,
          ),
        ),
      ),
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Transform.scale(
                    scale: 0.5,
                    child: Image.asset(
                      'assets/images/logo-1.png',
                      fit: BoxFit.cover,
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      height: SizeConfig.blockSizeVertical! * 30,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your email!',
                      style: kEncodeSansBold.copyWith(
                        color: kBlack,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter the email you used in registering an account with us',
                      style: kEncodeSansMedium.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeHorizontal * 3),

                  TextField(
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 1.5,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? kLightGrey
                              : purple,
                    ),
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(
                        context,
                      ).textTheme.displaySmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? kLightGrey
                                : purple,
                      ),
                      labelStyle: Theme.of(
                        context,
                      ).textTheme.displaySmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? kLightGrey
                                : purple,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                        ),
                      ),
                      prefixIcon: IconTheme(
                        data: IconThemeData(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                        ),
                        child: Icon(Icons.person),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 18,
                      ),
                      hintText: 'Enter Email Address',
                      label: Text(
                        'Enter Email Address',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      errorText:
                          _lastNameInputIsValid
                              ? null
                              : 'please enter only alphabetical characters only!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      // fillColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _lastNameInputIsValid = false;
                        });
                      } else if (!nameExp.hasMatch(value)) {
                        setState(() {
                          _lastNameInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _lastNameInputIsValid = true;
                        });
                      }
                    },
                  ),

                  // textFieldEmail(
                  //     'Enter Email', 'Enter Email', controller.emailController),
                  SizedBox(height: sizeHorizontal * 3),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'If the email provided is in our database, you\'ll receive an instruction on how to reset your password soon!!!',
                      style: kEncodeSansMedium.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeHorizontal * 3),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              colors: [purple, purple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (controller.emailController.text.isEmpty) {
                                AppToast.error('Email field can\'t be empty');
                              } else {
                                controller.forgetPassword();
                              }

                              print(controller.emailController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: kWhite,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child:
                                isLoading
                                    ? const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Loading please wait...',
                                          style: TextStyle(color: kWhite),
                                        ),
                                      ],
                                    )
                                    : Text(
                                      'Log In',
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                            2.5,
                                        color: kWhite,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: sizeHorizontal * 3),
                  SizedBox(height: sizeHorizontal * 13),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
