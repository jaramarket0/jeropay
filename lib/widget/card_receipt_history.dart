import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';

class ReceiptCardHistory extends StatelessWidget {
  const ReceiptCardHistory({
    super.key,
    required this.sizeVertical,
    required this.sizeHorizontal,
    required this.networkImage,
    required this.networkName,
    required this.index,
    required this.status,
    required this.onPressed,
    required this.details,
    required this.amount,
    required this.phoneNumber,
    required this.type,
  });

  final double sizeVertical;
  final double sizeHorizontal;
  final int index;
  final String type;
  final String? details;
  final String networkImage;
  final String status;
  final String networkName;
  final String phoneNumber;
  final String amount;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
            CircleAvatar(radius: 15, backgroundImage: AssetImage(networkImage)),
            SizedBox(width: sizeHorizontal * 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type == 'AdminCredit' ? 'Wallet Credited' : "$networkName $type",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 1.3,
                  ),
                ),
                SizedBox(height: sizeHorizontal * 0.5),
                Text(
                  type == 'AdminCredit' ? 'Manual Account Funding' : (details ?? phoneNumber),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 1.3,
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
                  '\u20A6$amount',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 1.3,
                  ),
                ),
                SizedBox(height: sizeHorizontal * 0.5),
                Text(
                  status.toUpperCase(),
                  style: kEncodeSansRegular.copyWith(
                    color: Colors.lightGreen,
                    fontSize: SizeConfig.blockSizeVertical! * 1.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
