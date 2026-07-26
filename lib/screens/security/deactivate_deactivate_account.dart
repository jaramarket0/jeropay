import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/widget/button.dart';

class DeactivateDeactivateAccount extends StatefulWidget {
  const DeactivateDeactivateAccount({super.key});

  @override
  State<DeactivateDeactivateAccount> createState() => _DeactivateDeactivateAccountState();
}

class _DeactivateDeactivateAccountState extends State<DeactivateDeactivateAccount> {
  bool isDeactivateAccount = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Deactivate Account', style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),),
                centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            SizedBox(height: sizeVertical * 2,),
            Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
                  child: Icon(CupertinoIcons.delete),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deactivate Account',
                      style: kEncodeSansSemiBold.copyWith(
                        color: Color(0xff332052),
                        fontSize: SizeConfig.blockSizeVertical! * 2,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Deactivate your account.',
                        style: kEncodeSansSmall.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //Icon(Icons.chevron_right_rounded),
                Switch(value: isDeactivateAccount, onChanged: (value) {
                  // Handle switch toggle
                  setState(() {
                    isDeactivateAccount = value;
                  });
                }),
              ],
            ),
            SizedBox(height: sizeVertical * 2,),
            TextFormField(
              decoration: InputDecoration(
                labelStyle: kEncodeSansRegular.copyWith(
                  color: kGrey,
                  fontSize: SizeConfig.blockSizeVertical! * 2,
                ),
                labelText: 'Reason for Deactivation',
                hintText: 'Please provide a reason for deactivating your account',
                border: OutlineInputBorder(),
              ),
              maxLines: 7,
            ),
            SizedBox(height: sizeVertical * 2,),
            button(text1: 'Deactivate Account', isLoading1: false, tap: () {})
          ],
        ),
      ),
    );
  }
}