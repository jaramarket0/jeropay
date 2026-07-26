// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jeropay/config/app_style.dart';
// import 'package:jeropay/config/size_config.dart';
// import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
// import 'package:jeropay/screens/home_screen/model/models.dart';

// HomeScreenController controller = Get.find<HomeScreenController>();

// class VirtualAccountScreen extends StatefulWidget {
//   const VirtualAccountScreen({super.key});

//   @override
//   State<VirtualAccountScreen> createState() => _VirtualAccountScreenState();
// }

// class _VirtualAccountScreenState extends State<VirtualAccountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double sizeVertical = SizeConfig.blockSizeVertical!;
//     double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Virtual Account',
//           style: kEncodeSansSemiBold.copyWith(
//             color:
//                 Theme.of(context).brightness == Brightness.dark
//                     ? kLightGrey
//                     : Color(0xff332052),
//             fontSize: SizeConfig.blockSizeVertical! * 2,
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         children: [
//           Container(
//             height: sizeVertical * 8,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color(0xff332052),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: [
//                 SizedBox(width: sizeHorizontal * 1),
//                 Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//                   width: sizeHorizontal * 5,
//                   height: sizeVertical * 5,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color:
//                         Theme.of(context).brightness == Brightness.dark
//                             ? Color(0xff332052)
//                             : kLightGrey,
//                   ),
//                   child: Icon(CupertinoIcons.bell),
//                 ),
//                 SizedBox(width: sizeHorizontal * 2),
//                 Expanded(
//                   child: Text(
//                     'Transafer to any of the account number below to fund your wallet',
//                     style: kEncodeSansSemiBold.copyWith(
//                       color:
//                           Theme.of(context).brightness == Brightness.dark
//                               ? Color(0xff332052)
//                               : kWhite,
//                       fontSize: SizeConfig.blockSizeVertical! * 1.7,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: sizeVertical * 2),
//           //TODO: starts here
//           SizedBox(
//           // height: sizeVertical * 70,
//             //width: double.infinity,
//             child: Container(
//               height: sizeVertical * 70,
//               child: Column(
//                 children: [
//                   Container(
//                     height: 30,
//                     child: ListView.separated(
//                       physics: BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount:
//                           controller.dashboardModel.data!.virtualAccounts!.length,
//                       //scrollDirection: Axis.ver,
//                       separatorBuilder: (context, index) => SizedBox(width: 10),
//                       itemBuilder: (context, index) {
//                         VirtualAccounts acct =
//                             controller.dashboardModel.data!.virtualAccounts![index];
//                         return Container(
//                           //  height:154,
//                           padding: EdgeInsets.all(8),
//                           width: sizeHorizontal * 35,
//                           //height: MediaQuery.of(context).size.height * 154,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 0.7,
//                               color: Color(0xff332052).withValues(alpha: 1),
//                             ),
//                             color: Colors.black.withValues(alpha: 0.8),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 spacing: 3,
//                                 children: [
//                                   Text(
//                                     'Account No:',
//                                     style: kEncodeSansSmall.copyWith(
//                                       color: kWhite,
//                                       fontSize: SizeConfig.blockSizeVertical! * 1.5,
//                                     ),
//                                   ),
//                                   Text(
//                                     acct.accountNumber!,
//                                     style: kEncodeSansMedium.copyWith(
//                                       color: kWhite,
//                                       fontSize: SizeConfig.blockSizeVertical! * 1.5,
//                                     ),
//                                   ),
//                                   Icon(Icons.copy_rounded, size: 15, color: kWhite),
//                                   Spacer(),
//                                   SizedBox(
//                                     width: sizeHorizontal * 3,
//                                     height: sizeVertical * 3,
//                                     child: Image.asset('assets/images/Mastercard.png'),
//                                   ),
//                                 ],
//                               ),
//                               Spacer(),
//                               Row(
//                                 spacing: 3,
//                                 children: [
//                                   Text(
//                                     'Bank:',
//                                     style: kEncodeSansSmall.copyWith(
//                                       color: kWhite,
//                                       fontSize: SizeConfig.blockSizeVertical! * 1.5,
//                                     ),
//                                   ),
//                                   Text(
//                                     acct.bankName!,
//                                     style: kEncodeSansMedium.copyWith(
//                                       color: kWhite,
//                                       fontSize: SizeConfig.blockSizeVertical! * 1.5,
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                     'JeroPay',
//                                     style: kEncodeSansRegular.copyWith(
//                                       color: kWhite,
//                                       fontSize: SizeConfig.blockSizeVertical! * 1.5,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           //TODO: ends here
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/screens/home_screen/model/models.dart';

HomeScreenController controller = Get.find<HomeScreenController>();

class VirtualAccountScreen extends StatefulWidget {
  const VirtualAccountScreen({super.key});

  @override
  State<VirtualAccountScreen> createState() => _VirtualAccountScreenState();
}

class _VirtualAccountScreenState extends State<VirtualAccountScreen> {
  void _copyToClipboard(String text, String type) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$type copied to clipboard'),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xff332052),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Virtual Account',
          style: kEncodeSansSemiBold.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? kLightGrey
                : Color(0xff332052),
            fontSize: SizeConfig.blockSizeVertical! * 2,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // Info Banner
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xff332052),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Icon(
                    CupertinoIcons.bell,
                    color: kWhite,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Transfer to any of the account numbers below to fund your wallet',
                    style: kEncodeSansSemiBold.copyWith(
                      color: kWhite,
                      fontSize: SizeConfig.blockSizeVertical! * 1.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 24),
          
          // Virtual Accounts Section
          Text(
            'Available Virtual Accounts',
            style: kEncodeSansSemiBold.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? kLightGrey
                  : Color(0xff332052),
              fontSize: SizeConfig.blockSizeVertical! * 2.2,
            ),
          ),
          
          SizedBox(height: 16),
          
          // Account Cards - Vertical Layout
          ...controller.dashboardModel.data!.virtualAccounts!.map((acct) {
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff332052),
                    Color(0xff4a2c6a),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        acct.bankName!,
                        style: kEncodeSansSemiBold.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockSizeVertical! * 2.2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'VIRTUAL',
                          style: kEncodeSansSmall.copyWith(
                            color: kWhite,
                            fontSize: SizeConfig.blockSizeVertical! * 1.2,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Account Number Section
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Account Number',
                            style: kEncodeSansSmall.copyWith(
                              color: kWhite.withOpacity(0.8),
                              fontSize: SizeConfig.blockSizeVertical! * 1.4,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            acct.accountNumber!,
                            style: kEncodeSansSemiBold.copyWith(
                              color: kWhite,
                              fontSize: SizeConfig.blockSizeVertical! * 2.4,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => _copyToClipboard(acct.accountNumber!, 'Account number'),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.copy_rounded,
                            color: kWhite,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Account Name Section
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account Name',
                              style: kEncodeSansSmall.copyWith(
                                color: kWhite.withOpacity(0.8),
                                fontSize: SizeConfig.blockSizeVertical! * 1.4,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              acct.accountName!,
                              style: kEncodeSansMedium.copyWith(
                                color: kWhite,
                                fontSize: SizeConfig.blockSizeVertical! * 1.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Bank Logo placeholder
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Mastercard.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.account_balance,
                                color: Color(0xff332052),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Quick Actions
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _copyToClipboard(acct.accountNumber!, 'Account number'),
                          icon: Icon(Icons.copy, size: 16),
                          label: Text('Copy Number'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xff332052),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Share functionality
                            final text = 'Account Number: ${acct.accountNumber!}\nBank: ${acct.bankName!}';
                            _copyToClipboard(text, 'Account details');
                          },
                          icon: Icon(Icons.share, size: 16),
                          label: Text('Share'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: kWhite,
                            side: BorderSide(color: kWhite.withOpacity(0.5)),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
          
          // Info Card
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xff332052).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xff332052),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Important Information',
                      style: kEncodeSansSemiBold.copyWith(
                        color: Color(0xff332052),
                        fontSize: SizeConfig.blockSizeVertical! * 1.8,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  '• Transfers to these accounts are processed instantly\n'
                  '• Minimum transfer amount is ₦100\n'
                  '• Maximum daily transfer limit is ₦500,000\n'
                  '• Use your registered name for transfers',
                  style: kEncodeSansRegular.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kLightGrey
                        : Colors.grey[700],
                    fontSize: SizeConfig.blockSizeVertical! * 1.5,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}