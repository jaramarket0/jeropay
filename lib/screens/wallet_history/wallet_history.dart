import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/receipt_screen/receipt_screen.dart';
import 'package:jeropay/screens/wallet_history/controller/wallet_controller.dart';
import 'package:jeropay/screens/wallet_history/models/models.dart';
import 'package:jeropay/widget/card_receipt.dart';
import 'package:jeropay/widget/card_receipt_history.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class WalletHistoryScreen extends StatefulWidget {
  const WalletHistoryScreen({super.key});

  @override
  State<WalletHistoryScreen> createState() => _WalletHistoryScreenState();
}

class _WalletHistoryScreenState extends State<WalletHistoryScreen> {
  late WalletController controller;
  List<String> networkName = <String>['MTN', 'AIRTEL', 'GLO', '9 MOBILE'];

  @override
  void initState() {
    super.initState();
    controller = Get.put(WalletController());
  }

  List<String> networkImage = <String>[
    'assets/images/mtn.png',
    'assets/images/airtel.png',
    'assets/images/glo.png',
    'assets/images/9mobile.png',
  ];

  Map<String, dynamic> networkImageMap = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9 MOBILE': 'assets/images/9mobile.png',
  };


  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    controller.transactions();
  }

  String? getImageFromNetwork(String network) {
    return networkImageMap.keys.firstWhere(
      (key) => networkImageMap[key] == network,
      orElse: () => 'assets/images/logo-1.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet History',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
      ),

      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                // SearchBar()
                TextField(
                  style: kEncodeSansRegular.copyWith(
                    color: Color(0xff332052),
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  ),
        
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 13),
                    prefixIcon: IconTheme(
                      data: IconThemeData(
                        color: ThemeUtils.getSecondaryColor(context),
                      ),
                      child: Icon(Icons.search),
                    ),
                    hintText: 'Search for transactions...',
                    border: ThemeUtils.getInputBorder(context),
                    errorBorder: ThemeUtils.getInputBorder(context),
                    disabledBorder: ThemeUtils.getInputBorder(context),
                    focusedBorder: ThemeUtils.getInputBorder(context),
                    focusedErrorBorder: ThemeUtils.getInputBorder(context),
                    enabledBorder: ThemeUtils.getInputBorder(context),
        
                    hintStyle: kEncodeSansRegular.copyWith(
                      color: ThemeUtils.getTextColor(context, isSecondary: true),
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                  ),
                ),
                SizedBox(height: sizeVertical * 2),
                SizedBox(
                  height: sizeVertical * 100,
                  child: Obx(() {
                    return controller.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : controller.transactionList.isEmpty
                                ? Center(child: Text('No history'))
                                : ListView.separated(
                          itemBuilder: (context, index) {
                            Data data = controller.transactionList[index];
                            return  ReceiptCardHistory(
                                  sizeHorizontal: sizeHorizontal,
                                  sizeVertical: sizeVertical,
                                  index: index,
                                  status: data.status!,
                                  amount: data.amount!,
                                  phoneNumber: data.phoneNumber!,
                                  type: data.type!,
                                  details: data.detail,
                                  networkImage:
                                      networkImageMap[data
                                          .network!] ?? 'assets/images/logo-1.png', // getImageFromNetwork(data.network!)!,
                                  networkName: data.network!,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(
                                        builder:
                                            (context) => ReceiptScreen(
                                              networkImage:
                                                  networkImageMap[data
                                                      .network!] ?? 'assets/images/logo-1.png', //getImageFromNetwork(data.network!)!,
                                              networkName: data.network!,
                                              transactionModel: data,
                                            ),
                                      ),
                                    );
                                    // print(networkImageMap[data.network]);
                                    //print(networkImageMap['AIRTEL']);
                                    String? imahe = getImageFromNetwork(
                                      data.network!,
                                    );
                                    String? imagePath =
                                        networkImageMap[data.network!];
                                    print(imahe);
                                    print(imagePath);
                                  },
                                );
                          },
                          separatorBuilder:
                              (context, index) => SizedBox(height: 10),
                          itemCount: controller.transactionList.length,
                        );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
