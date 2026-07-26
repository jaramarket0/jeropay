import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/screens/referral/controller/referral_controller.dart';
import 'package:jeropay/widget/button.dart';
import 'package:jeropay/widget/search_bar.dart';

HomeScreenController homeController = Get.find<HomeScreenController>();

ReferralController controller = Get.put(ReferralController());

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {

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

List<String> name = <String>[
  //'Jero Pay User',
  
];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            //indicator: BoxDecoration(),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [Tab(text: 'Campaign'), Tab(text: 'Referrals')],
          ),
          title: Text(
            'Referral',
            style: 
          Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Text('data')
                    SizedBox(height: sizeVertical * 2),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.withValues(alpha: 0.1),
                      ),
                      height: sizeVertical * 6,
                      width: double.infinity,
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.wallet, color: Colors.grey),
                          Text(
                            'Referral Bonus',
                            style: kEncodeSansRegular.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Color(0xff332052),
                              fontSize: SizeConfig.blockSizeVertical! * 2.3,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\u20A60.00',
                            style: kEncodeSansBold.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : kBlack,
                              fontSize: SizeConfig.blockSizeVertical! * 2.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: sizeVertical * 1),
                    SizedBox(
                      width: sizeHorizontal * 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 0.5, color: Colors.black),
                          elevation: 0.0,
                        ),
                        child: Text(
                          'Move Bonus to Wallet',
                          style: kEncodeSansRegular.copyWith(
                            color: Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sizeVertical * 3),
                    Container(
                      height: sizeVertical * 20,
                      width: sizeHorizontal * 30,
                      decoration: BoxDecoration(
                       // color: Colors.grey.withValues(alpha: .1),
                      ),
                      child: Image.asset(
                        'assets/images/referral.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: sizeVertical * 3),
                    Text(
                      'Invite your friend and receive bonus on their transactions',
                      textAlign: TextAlign.center,
                      style: kEncodeSansBold.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : kBlack,
                        fontSize: SizeConfig.blockSizeVertical! * 2.5,
                      ),
                    ),
                    SizedBox(height: sizeVertical * 2),
                    Text(
                      'Invite your friends to join JeroPay and unlock exciting rewards! Simply share your referral code, Continue to receive commissions on their transactions through the portal. It\'s the ultimate reward for a lifetime',
                      textAlign: TextAlign.center,
                      style:  Theme.of(
                                context,
                              ).textTheme.displaySmall?.copyWith(
                                fontSize: SizeConfig.blockSizeVertical! * 1.4,
                              ),
                    ),
                    SizedBox(height: sizeVertical * 3),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your unique referral code',
                        style: kEncodeSansMedium.copyWith(
                          color: kBlack,
                          fontSize: SizeConfig.blockSizeVertical! * 2.0,
                        ),
                      ),
                    ),
                    SizedBox(height: sizeVertical * 3),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeHorizontal * 1,
                      ),
                      height: sizeVertical * 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 0.5,
                          color: Color(0xff5f2e96),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text( homeController.dashboardModel.data!.profile!.username  ??    'Jeropay User'),
                          Spacer(),
                          Container(
                            height: sizeVertical * 5,
                            width: sizeHorizontal * 17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff5f2e96).withValues(alpha: .3),
                            ),
                            child: GestureDetector(
                              onTap: ()=> _copyToClipboard(homeController.dashboardModel.data!.profile!.username!,'Referral Code'),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.copy,
                                    color: Color(0xff5f2e96),
                                    size: 18,
                                  ),
                                  Text(
                                    'Copy Referral Code',
                                    style: kEncodeSansRegular.copyWith(
                                      color: Color(0xff5f2e96),
                                      fontSize:
                                          SizeConfig.blockSizeVertical! * 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: sizeVertical * 2),
                    button(text1: 'Refer a friend', isLoading1: false, tap: (){}),
                    SizedBox(height: sizeVertical * 2),

                  ],
                ),
              ),
            ),
            Center(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                SearchBar1(controller: controller.searchController,hintText: 'search here',onChanged: (value){},),
                //SizedBox(height: sizeVertical * 2),
//SizedBox(height: sizeVertical * 2),
// name.isEmpty ? Text('data') :
                    ...name.map((e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: sizeVertical * 0.5),
                      child: ListTile(
                        focusColor: kWhite,
                        splashColor: kWhite,
                        tileColor: kWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.1),
                          child: Text(
                            e[0].toUpperCase(),
                            style: kEncodeSansBold.copyWith(
                              color: Color(0xff332052),
                              fontSize: SizeConfig.blockSizeVertical! * 2.0,
                            ),
                          ),
                        ),
                        title: Text(
                          e,
                          style: kEncodeSansRegular.copyWith(
                            color: Color(0xff332052),
                            fontSize: SizeConfig.blockSizeVertical! * 2.0,
                          ),
                        ),
                      ),
                    ))
              ],),
            )),
          ],
        ),
      ),
    );
  }
}
