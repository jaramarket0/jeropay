import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/supplimetary_screens/privacy_policy.dart';
import 'package:jeropay/screens/supplimetary_screens/terms_and_condition.dart';

class Legal extends StatelessWidget {
  const Legal({super.key});

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal Information',style: kEncodeSansBold.copyWith(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Color(0xff332052),
              fontSize: SizeConfig.blockSizeVertical! * 2.5,
            ),),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 2),
          children: [
            SizedBox(height: sizeVertical * 2),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => PrivacyPolicy(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.privacy_tip_rounded,color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy Policy', 
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Learn more about how we handle \nyour data',
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
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => TermsAndConditions(),));
              },
              child: Row(
                spacing: 5,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                    child: Icon(Icons.info_sharp,color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Terms and Conditions',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Learn more about our terms and conditions',
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
          ],
        ),
      ),
    );
  }
}