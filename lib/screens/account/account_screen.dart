import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/ThemeController.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/account/controller/account_controller.dart';
import 'package:jeropay/screens/edit_user/edit_user_screen.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/screens/referral/referral_screen.dart';
import 'package:jeropay/screens/supplimetary_screens/account_limits.dart';
import 'package:jeropay/screens/supplimetary_screens/legal.dart';
import 'package:jeropay/screens/supplimetary_screens/settings.dart';
import 'package:jeropay/screens/supplimetary_screens/support.dart';

HomeScreenController controller = Get.find<HomeScreenController>();
AccountController accountController = Get.put(AccountController());


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: 
          Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: sizeHorizontal * 10,
                      height: sizeVertical * 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.5, color: Colors.black),
                        color: Color(0xff5f2e96).withValues(alpha: 0.1),
                      ),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Image.asset('assets/images/3d-rendering-zoom-call-avatar-removebg-preview.png',scale: 1,)),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        width: sizeHorizontal * 3,
                        height: sizeVertical * 3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff332052),
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditUserScreen(),));
                          },
                          child: Icon(Icons.edit, color: kWhite, size: 12)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeVertical * 2),
                Text(
                  controller.dashboardModel.data?.name ?? 'jeropay user',
                  style: 
                  Theme.of(context).textTheme.labelLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2,
                ),
                  // kEncodeSansBold.copyWith(
                  //   color: kBlack,
                  //   fontSize: SizeConfig.blockSizeVertical! * 2,
                  // ),
                ),
                Text(
                 controller.dashboardModel.data!.profile!.username ?? 'jeropay user',
                  style: kEncodeSansMedium.copyWith(
                    color: Colors.grey,
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),
                ),
                SizedBox(height: sizeVertical * 2),
                 Align(
                  alignment: Alignment.bottomLeft,
                   child: Text(
                    'General Setings',
                    style: kEncodeSansSemiBold.copyWith(
                      color: Colors.grey,
                      fontSize: SizeConfig.blockSizeVertical! * 2,
                    ),),
                 ),
                 SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: (){
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditUserScreen(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.person,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
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
                          'Edit your information.',
                          style: Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
                                fontSize: SizeConfig.blockSizeVertical! * 1.5,
                              ),
                          // kEncodeSansSmall.copyWith(
                          //   color: Theme.of(context).brightness == Brightness.dark
                          // ? kLightGrey
                          // : Color(0xff332052),
                          //   // Color(0xff332052),
                          //   fontSize: SizeConfig.blockSizeVertical! * 1.5,
                          // ),
                        ),
                      ),
                    ],
                  ),  
                  Spacer(),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
            SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => Settings(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.settings,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Account Notifications',
                          style: Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
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
            SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => AccountLimits(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.verified,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Limits',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Upgrade your jeropay account',
                          style: Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
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
            SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ReferralScreen(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.person_search,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Referral',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Referrals Commissions',
                          style: Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
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
            SizedBox(height: sizeVertical * 2),
            Row(
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(CupertinoIcons.moon,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dark Mode',
                      style: kEncodeSansSemiBold.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                        fontSize: SizeConfig.blockSizeVertical! * 2,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Switch app display mode to your \npreference',
                        style: Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
                                fontSize: SizeConfig.blockSizeVertical! * 1.5,
                              ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ThemeSwitch()
              ],
            ),
            SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => Support(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.support_agent,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Help and Support',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Help or contact our customer service',
                          style: Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
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
            SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => Legal(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.security_outlined,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Legal',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Privacy,Security & Terms',
                          style: Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
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
            SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) => SizedBox(
               //   height: 100,
                  child: AlertDialog(
                    icon: Icon(Icons.logout),
                    content: Text('Are you sure want to log out?'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('No')),
                      TextButton(onPressed: (){
                        accountController.logOut();
                      }, child: Text('Yes')),
                    ],
                  ),
                ),);
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.logout,color:  Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log Out',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Sign out of your account.',
                          style: Theme.of(
                                  context,
                                ).textTheme.displaySmall?.copyWith(
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
            SizedBox(height: sizeVertical * 3),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
