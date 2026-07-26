import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/widget/button.dart';

class AccountLimits extends StatelessWidget {
  const AccountLimits({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Limits',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 2),
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.pinkAccent.withValues(alpha: 0.25)
                  : Colors.pinkAccent.withValues(alpha: 0.035),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BASIC',
                  style: kEncodeSansMedium.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                    fontSize: SizeConfig.blockSizeVertical! * 2.3,
                  ),
                ),
                SizedBox(height: sizeVertical * 2),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Limit:',
                          style: kEncodeSansSmall.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Color.fromARGB(255, 119, 0, 255)
                                  : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A65,000',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Max Balance',
                          style: kEncodeSansSmall.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A610,000',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeVertical * 2,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.pinkAccent.withValues(alpha: 0.25)
                  : Colors.pinkAccent.withValues(alpha: 0.035),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TIER 1',
                  style: kEncodeSansMedium.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                    fontSize: SizeConfig.blockSizeVertical! * 2.3,
                  ),
                ),
                SizedBox(height: sizeVertical * 2),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Limit:',
                          style: kEncodeSansSmall.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A610,000',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Max Balance',
                          style: kEncodeSansSmall.copyWith(
                            color:Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A650,000',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeVertical * 2,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.pinkAccent.withValues(alpha: 0.25)
                  : Colors.pinkAccent.withValues(alpha: 0.035),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TIER 2',
                  style: kEncodeSansMedium.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                    fontSize: SizeConfig.blockSizeVertical! * 2.3,
                  ),
                ),
                SizedBox(height: sizeVertical * 2),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Limit:',
                          style: kEncodeSansSmall.copyWith(
                            color:Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A6100,000.00',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Max Balance',
                          style: kEncodeSansSmall.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A6200,000.00',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeVertical * 2,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.pinkAccent.withValues(alpha: 0.25)
                  : Colors.pinkAccent.withValues(alpha: 0.035),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TIER 3 (BUSINESS)',
                  style: kEncodeSansMedium.copyWith(
                    color:Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                    fontSize: SizeConfig.blockSizeVertical! * 2.3,
                  ),
                ),
                SizedBox(height: sizeVertical * 2),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Limit:',
                          style: kEncodeSansSmall.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A65,000,000.00',
                          style: kEncodeSansSemiBold.copyWith(
                            color:Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Max Balance',
                          style: kEncodeSansSmall.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                        ),
                        Text(
                          '\u20A610,000,000.00',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 119, 0, 255)
                                : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeVertical * 2,),
          button(text1: 'Upgrade Account', isLoading1: false, tap: (){})
        ],
      ),
    );
  }
}
