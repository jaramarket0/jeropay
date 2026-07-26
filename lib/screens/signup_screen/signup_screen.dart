import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart' show SizeConfig;
import 'package:jeropay/screens/signup_screen/controller/signup_controller.dart';
import 'package:jeropay/config/app_toast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../widget/button.dart';
// import '../firebase_options.dart';
// import 'dart:developer' as devtools;

SignupController controller = Get.put(SignupController());

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  bool _isCheck = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Register',
                    style: kEncodeSansBold.copyWith(
                      color: kBlack,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  // SizedBox(
                  //   height: sizeHorizontal * 4,
                  // ),
                  Transform.scale(
                    scale: 0.5,
                    child: Image.asset(
                      'assets/images/logo-1.png',
                      fit: BoxFit.cover,
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      height: SizeConfig.blockSizeVertical! * 30,
                    ),
                  ),
                  // SizedBox(
                  //   height: sizeHorizontal * 4,
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello!',
                      style: kEncodeSansBold.copyWith(
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? kLightGrey
                                : purple,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Register an account with us',
                      style: kEncodeSansMedium.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2,
                      ),
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
                    controller: controller.fullNameController,
                    keyboardType: TextInputType.name,
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
                      hintText: 'Enter Full Name',
                      label: Text(
                        'Enter Full Name',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
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
                    controller: controller.userNameController,
                    keyboardType: TextInputType.name,
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
                      hintText: 'Enter User Name',
                      label: Text(
                        'Enter User Name',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
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
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
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
                        child: Icon(Icons.email),
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
                      //errorText: 'please enter the meter type!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      //fillColor: kLightGrey,
                    ),
                  ),
                  SizedBox(height: sizeHorizontal * 3.5),
                  TextField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
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
                      hintText: 'Enter Phone Number',
                      label: Text(
                        'Enter Phone Number',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
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
                    controller: controller.addressController,
                    keyboardType: TextInputType.streetAddress,
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
                      hintText: 'Enter Home Address',
                      label: Text(
                        'Enter Home Address',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      // errorText:
                      //     _emailInputIsValid
                      //         ? null
                      //         : 'please enter only alphabetical characters only!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      // fillColor: kLightGrey,
                    ),
                    // onChanged: (value) {
                    //   if (value.isEmpty) {
                    //     setState(() {
                    //       _emailInputIsValid = false;
                    //     });
                    //   } else if (!emailExp.hasMatch(value)) {
                    //     setState(() {
                    //       _emailInputIsValid = false;
                    //     });
                    //   } else {
                    //     setState(() {
                    //       _emailInputIsValid = true;
                    //     });
                    //   }
                    // },
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
                    controller: controller.referralController,
                    keyboardType: TextInputType.streetAddress,
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
                      hintText: 'Enter Referral Code (Optional)',
                      label: Text(
                        'Enter Referral Code (Optional)',
                        style: kEncodeSansSemiBold.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
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
                      hintText: 'Confrim Password',
                      label: Text(
                        'Confirm Password',
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
                      // fillColor: kLightGrey,
                    ),
                  ),
                  SizedBox(height: sizeHorizontal * 3.5),
                  Row(
                    children: [
                      Checkbox(
                        side: BorderSide(color: purple, width: 2),
                        // value: false,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              _isCheck = newValue;
                            });
                          }
                        },
                        value: _isCheck,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'By Proceeding you agree to the Jero Pay Privacy Policy',
                          style: kEncodeSansMedium.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: sizeHorizontal * 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child:
                    // Consumer<AuthenticationProvider>(
                    //     builder: (context, value, child) {
                    //   WidgetsBinding.instance.addPostFrameCallback((_) {
                    //     if (value.reqMessage != '') {
                    //       successMessage(
                    //           message: value.reqMessage,
                    //           x: value.color,
                    //           context: context);
                    //       value.clear();
                    //     }
                    //   });
                    //   return
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                colors: [purple, purple],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (!_isCheck) {
                                  AppToast.error('Please agree to our privacy policy');
                                } else {
                                  controller.createUser();
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
                                        'Register',
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
                    // }),
                  ),
                  SizedBox(height: sizeHorizontal * 4),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'OR',
                          style: kEncodeSansMedium.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: sizeHorizontal * 4),
                  Obx(() => SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: controller.isGoogleLoading.value
                          ? null
                          : () => controller.signUpWithGoogle(),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: controller.isGoogleLoading.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Color(0xff5f2e96),
                                strokeWidth: 2.5,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xFFDB4437),
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Continue with Google',
                                  style: kEncodeSansSemiBold.copyWith(
                                    color: kBlack,
                                    fontSize: SizeConfig.blockSizeHorizontal! * 2.2,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  )),
                  SizedBox(height: sizeHorizontal * 4),
                  Text.rich(
                    TextSpan(
                      text: "Have an account already? ",
                      style: kEncodeSansMedium.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In ',
                          style: kEncodeSansBold.copyWith(
                            color: kYellow,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.2,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/signin_screen",
                                    (route) => false,
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeHorizontal * 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
