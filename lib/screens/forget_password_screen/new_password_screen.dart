import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/forget_password_screen/controller/forget_password_controller.dart';
import 'package:jeropay/widget/textField.dart';

import 'package:flutter/material.dart';
import 'package:jeropay/config/app_toast.dart';

class NewPasswordScreen extends StatefulWidget {
  NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late ForgetPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<ForgetPasswordController>();
  }

    final RegExp nameExp = RegExp(r'^[A-Za-z]+$');
  final RegExp usernameExp = RegExp(r'^[a-zA-Z0-9*\-_@/\\]+$');
  bool _firstNameInputIsValid = true;
  bool _lastNameInputIsValid = true;
  bool _usernameInputIsValid = true;
  
  final bool isLoading = false;

    bool _passwordVisible = false;
    bool _passwordVisible1 = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeHorizontal = SizeConfig.blockSizeVertical!;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 54),
          child: Column(
            children: [
              Text(
                'Reset Password.',
                style: kEncodeSansBold.copyWith(
                  color: kGrey,
                  fontSize: sizeHorizontal * 3.5,
                ),
              ),
              SizedBox(height: sizeHorizontal * 3.5),
              
               TextField(
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 1.5,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? kLightGrey
                              : purple,
                    ),
                    controller: controller.tokenController,
                    keyboardType: TextInputType.text,
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
                      hintText: 'Enter Code',
                      label: Text(
                        'Enter Code',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      errorText:
                          _firstNameInputIsValid
                              ? null
                              : 'please enter only alphabetical characters only!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      //  fillColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _firstNameInputIsValid = false;
                        });
                      } else if (!nameExp.hasMatch(value)) {
                        setState(() {
                          _firstNameInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _firstNameInputIsValid = true;
                        });
                      }
                    },
                  ),
              // textField(
              //   'Enter Token',
              //   'Enter Old Password',
              //   controller.tokenController,
              // ),


              SizedBox(height: sizeHorizontal * 3.5),
              // textField(
              //   'Enter New Password',
              //   'Enter New Password',
              //   controller.passwordController,
              // ),

              TextField(
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 1.5,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? kLightGrey
                              : purple,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisible,
                    controller: controller.passwordController,
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
                      suffixIcon: IconTheme(
                        data: IconThemeData(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon:
                              _passwordVisible
                                  ? Icon(
                                    Icons.visibility_off,
                                    color:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? kLightGrey
                                            : purple,
                                  )
                                  : Icon(
                                    Icons.remove_red_eye,
                                    color:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? kLightGrey
                                            : purple,
                                  ),
                        ),
                      ),
                      prefixIcon: IconTheme(
                        data: IconThemeData(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                        ),
                        child: Icon(Icons.security),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 18,
                      ),
                      hintText: 'Enter Password',
                      label: Text(
                        'Enter Password',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      //errorText: 'please enter the meter type!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      //fillColor: kLightGrey,
                    ),
                  ),
              SizedBox(height: sizeHorizontal * 3.5),
              

              TextField(
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 1.5,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? kLightGrey
                              : purple,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisible1,
                    controller: controller.confirmPasswordController,
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
                      suffixIcon: IconTheme(
                        data: IconThemeData(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible1 = !_passwordVisible1;
                            });
                          },
                          icon:
                              _passwordVisible1
                                  ? Icon(
                                    Icons.visibility_off,
                                    color:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? kLightGrey
                                            : purple,
                                  )
                                  : Icon(
                                    Icons.remove_red_eye,
                                    color:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? kLightGrey
                                            : purple,
                                  ),
                        ),
                      ),
                      prefixIcon: IconTheme(
                        data: IconThemeData(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                        ),
                        child: Icon(Icons.security),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 18,
                      ),
                      hintText: 'Confirm Passowrd',
                      label: Text(
                        'Confirm Passowrd',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      //errorText: 'please enter the meter type!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      //fillColor: kLightGrey,
                    ),
                  ),
              // textField(
              //   'Confirm New Password',
              //   'Confirm New Password',
              //   controller.confirmPasswordController,
              // ),
              SizedBox(height: sizeHorizontal * 3.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
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
                            print('token');
                            if (controller.passwordController.text ==
                                controller.confirmPasswordController.text) {
                              controller.newPassword();
                            } else {
                              AppToast.error('Password Not The Same');
                            }
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    'reset password',
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 2.5,
                                      color: kWhite,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                //
              ),
            ],
          ),
        ),
      ),
    );
  }
}
