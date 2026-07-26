import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/screens/security/add_pin.dart';
import 'package:jeropay/screens/security/change_password.dart';
import 'package:jeropay/screens/security/change_pin.dart';
import 'package:jeropay/screens/security/reset_pin.dart';

HomeScreenController controller = Get.find<HomeScreenController>();

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({super.key});

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {
  bool isBiometricEnabled = true;
  bool isBalanceHidden = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Security',style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),),
                centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 2),
        children: [
          SizedBox(height: sizeVertical * 2,),
          GestureDetector(
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => ChangePassword(),
              )), 
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.password,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change Password',
                        style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Change your account password.',
                          style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
            SizedBox(height: sizeVertical * 2,),
            GestureDetector(
              onTap: () {
                // Handle tap for Change Pin
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => ChangePin(),
                ));
              },
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.security,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change Pin',
                        style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Change your account pin.',
                         style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
            SizedBox(height: sizeVertical * 2,),
            GestureDetector(
              onTap: () {
                // Handle tap for Reset Pin
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => ResetPin(),
                ));
              },
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.security,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Pin',
                        style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Reset your pin with password.',
                          style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
            SizedBox(height: sizeVertical * 2,),
            
            GestureDetector(
              onTap: () {
                // Handle tap for Add Pin
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => AddPin(),
                ));
              },
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.lock,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Pin',
                        style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Add your pin.',
                          style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
            SizedBox(height: sizeVertical * 2,),
            Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(CupertinoIcons.shield,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Biometric',
                      style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                    ),
                    FittedBox(
                      child: Text(
                        'Activate face ID \nor fingerprint.',
                        style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //Icon(Icons.chevron_right_rounded),
                Switch(value: isBiometricEnabled, onChanged: (value) {
                  // Handle switch toggle
                  setState(() {
                    isBiometricEnabled = value;
                  });
                }),
              ],
            ),
            SizedBox(height: sizeVertical * 2,),
             Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(CupertinoIcons.shield,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hide wallet Balance',
                      style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                    ),
                    FittedBox(
                      child: Text(
                        'Hide or Show wallet balance.',
                        style: 
                // Theme.of(context).textTheme.headlineLarge?.copyWith(
                //   color: Color(0xff332052),
                //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                // ),
                        kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //Icon(Icons.chevron_right_rounded)
                Switch(value: controller.isHide.value, onChanged: (value) {
                  // Handle switch toggle
                  setState(() {
                   // isBalanceHidden = value;
                    controller.isHide.value = value;
                  });
                  
                }),
              ],
            ),
        ]
      )
    );
  }
}