import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/security/deactivate_deactivate_account.dart';
import 'package:jeropay/screens/supplimetary_screens/account_security.dart';
import 'package:jeropay/screens/supplimetary_screens/notification_setting.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),),
          centerTitle: true,
        actions: [],),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 2),
          children: [
            SizedBox(height: sizeVertical * 2,),
            GestureDetector(
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => AccountSecurity(),
              )), 
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
                        'Account Security',
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
                          'Change password,Biometric an \nwallet balance',
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
                // Handle tap for Notification Settings
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => NotificationSetting(),
                ));
              },
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.notifications,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification',
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
                          'Push Notification, Email Notitication',
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
                // Handle tap for Legal Information
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => DeactivateDeactivateAccount(),
                ));
              },
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.delete,color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deactivate/Delete Account',
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
                          'Account Deletion',
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
          ],
        ),
    );
  }
}