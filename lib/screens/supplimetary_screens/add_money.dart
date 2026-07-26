import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/supplimetary_screens/virtual_accounts.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet Funding',
          style: kEncodeSansBold.copyWith(
            color: Color(0xff332052),
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: sizeVertical * 2),
            Row(
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(Icons.money_outlined),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => VirtualAccountScreen()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Virtual Account',
                        style: kEncodeSansSemiBold.copyWith(
                          color:Theme.of(context).brightness == Brightness.dark
                            ? kLightGrey
                            : Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Make transfer to this account to fund \nyour wallet',
                          style: kEncodeSansSemiBold.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                            ? kLightGrey
                            : Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Icon(Icons.chevron_right_rounded)
              ],
            ),
SizedBox(height: sizeVertical * 2),
            Row(
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(Icons.payment),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paystack',
                      style: kEncodeSansSemiBold.copyWith(
                        color:Theme.of(context).brightness == Brightness.dark
                          ? kLightGrey
                          : Color(0xff332052),
                        fontSize: SizeConfig.blockSizeVertical! * 2,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Fund your walle with paystack ATM \ncheckout',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? kLightGrey
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
          ],
        ),
      ),
    );
  }
}
