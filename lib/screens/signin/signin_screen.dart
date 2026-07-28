// import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/forget_password_screen/forget_password_screen.dart';
import 'package:jeropay/screens/signin/controller/signin_controller.dart';

SigninController controller = Get.put(SigninController());

// import '../firebase_options.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _passwordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Sign In',
                    style: kEncodeSansBold.copyWith(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? kDarkGrey
                              : Color(0xff332052),
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  // SizedBox(
                  //   height: sizeHorizontal * 5,
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

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back!',
                      style: kEncodeSansBold.copyWith(
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? kDarkGrey
                                : Color(0xff332052),
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign in your account to continue',
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
                    controller: controller.userNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(
                        context,
                      ).textTheme.displaySmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : purple,
                      ),
                      labelStyle: Theme.of(
                        context,
                      ).textTheme.displaySmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : purple,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : purple,
                        ),
                      ),
                      prefixIcon: IconTheme(
                        data: IconThemeData(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
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
                                  ? Colors.white
                                  : purple,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                        ),
                      ),
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      //fillColor: kLightGrey,
                    ),
                  ),
                  SizedBox(height: sizeHorizontal * 4),
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
                                  ? Colors.white
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
                  SizedBox(height: sizeHorizontal * 1),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                ((context) => const ForgetPasswordScreen()),
                          ),
                        );

                        // const PasswordReset())));
                      },
                      child: Text(
                        'Forget Password?',
                        style: kEncodeSansMedium.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? kLightGrey
                                  : purple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child:
                    // Consumer<AuthenticationProvider>(
                    //   builder: (context, value, child) {
                    //     WidgetsBinding.instance.addPostFrameCallback((_) {
                    //       if (value.reqMessage != '') {
                    //         successMessage(
                    //             message: value.reqMessage,
                    //             x: value.color,
                    //             context: context);
                    //         value.clear();
                    //       }
                    //     });
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
                              onPressed: () async {
                                controller.loginUser();
                                // () async {
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
                    //
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
                          : () => controller.signInWithGoogle(),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey.shade300, width: 1.5),
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
                      text: "Don\'t have an account? ",
                      style: kEncodeSansMedium.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: kEncodeSansBold.copyWith(
                            color: kYellow,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.2,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/signup_screen",
                                    (route) => false,
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeHorizontal * 8),
                  //           TextButton(onPressed: (){
                  //            Navigator.of(Get.context!).push(
                  //   CupertinoPageRoute(builder: (context) => TransactionPinScreen()),
                  // );
                  //           }, child: Text('pin')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
