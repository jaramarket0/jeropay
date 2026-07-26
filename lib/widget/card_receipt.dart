import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/home_screen/model/models.dart';

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({
    super.key,
    required this.sizeVertical,
    required this.sizeHorizontal,
    required this.networkImage,
    required this.networkName, 
    required this.transactions,
    required this.details,
    
  });

  final double sizeVertical;
  final double sizeHorizontal;
  
  final String networkImage;
  final String networkName;
  final String details;
  final Transactions transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: sizeVertical * 10,
      width: sizeHorizontal * 35,
      //height: MediaQuery.of(context).size.height * 154,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemeUtils.getBackgroundColor(context),
        //const Color.fromARGB(240, 252, 251, 251),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 5,
            offset: Offset(2, 2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(networkImage),
          ),
          SizedBox(width: sizeHorizontal * 1),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$networkName ${details.length > 18 ? details.substring(18, details.length.clamp(0, 24)) : ''} \u20A6${transactions.amount}",
                    style: 
                    // kEncodeSansRegular.copyWith(
                    //   color: kBlack,
                    //   fontSize: SizeConfig.blockSizeVertical! * 1.3,
                    // ),
                    Theme.of(context).textTheme.displaySmall?.copyWith(
                      
                      fontSize: SizeConfig.blockSizeVertical! * 1.3,
                    ),
                    
                  ),
                  SizedBox(width: 10,),
                  Text(transactions.status!.capitalize!, style: 
                    // kEncodeSansRegular.copyWith(
                    //   color: kBlack,
                    //   fontSize: SizeConfig.blockSizeVertical! * 1.3,
                    // ),
                    Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: transactions.status!.toLowerCase() == 'success' ? Colors.green : Colors.red,
                      fontSize: SizeConfig.blockSizeVertical! * 1.3,
                    ),)
                ],
              ),
              SizedBox(height: sizeHorizontal * 0.5),
              Text(
                transactions.detail!,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 1.2,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\u20A6${transactions.amount}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 1.3,
                ),
              ),
              SizedBox(height: sizeHorizontal * 0.5),
              Text(
                (transactions.dateAndTime)!,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}