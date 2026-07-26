import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/cable_screen/confirmation.dart';
import 'package:jeropay/screens/cable_screen/controller/cable_controller.dart';
import 'package:jeropay/screens/cable_screen/models/models.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
//import 'package:jeropay/screens/edu_pins_screen/confirmation_screen.dart';
import 'package:jeropay/widget/button.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

CableController controller = Get.put<CableController>(CableController());
HomeScreenController homeScreenController = Get.find<HomeScreenController>();

class CableScreen extends StatefulWidget {
  const CableScreen({super.key});

  @override
  State<CableScreen> createState() => _CableScreenState();
}

class _CableScreenState extends State<CableScreen> {
  final List<String> networks = <String>['DSTV', 'GOTV', 'STARTIMES'];
  final Map<String, String> networkImage = {
    'DSTV': 'assets/images/dstv.png',
    'GOTV': 'assets/images/gotv.png',
    'STARTIMES': 'assets/images/image copy.png',
  };
  final Map<String, Color> networkColors = {
    'DSTV': Colors.lightBlue,
    'GOTV': Colors.white,
    'STARTIMES': Colors.blue,
  };

  List<CableModel> priceDesc = [];

  // String? selectedCable;

  // String? _selectedString;

  void filterByProvider(String provider) {
    setState(() {
      priceDesc =
          controller.cablePriceList
              .where(
                (plan) => plan.provider.toUpperCase() == provider.toUpperCase(),
              )
              .toList();

      //   // Get unique data types for this network
      //   availableDataTypes = filteredDataPlans
      //       .map((plan) => plan.planType)
      //       .toSet()
      //       .toList();

      //   // Reset selections
      //   controller.selectedString = null;
      //   selectedDataPlan = null;
      //   controller.amountController.clear();
    });
  }

  List<String> airtimeType = <String>['AWUF', 'VTU'];

  void _openTransactionSelector() async {
    final selected = await showModalBottomSheet<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      //showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(
                'Select Airtime Type',
                style: kEncodeSansBold.copyWith(
                  color: kDarkGrey,
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),
              ),

              SizedBox(height: 10),
              Divider(),

              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: airtimeType.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final type = airtimeType[index];
                    return ListTile(
                      title: Text(
                        type,
                        style: kEncodeSansRegular.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeVertical! * 2.0,
                        ),
                      ),
                      onTap: () => Navigator.pop(context, type),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    if (selected != null && selected != controller.selectedString) {
      setState(() {
        controller.selectedString = selected;
       // controller.selectedString = selected;

      });
    }
  }

  Widget getNetworkContent() {
    switch (controller.selectedCable) {
      case 'DSTV':
        return GestureDetector(
          onTap: () {
            _openTransactionSelector();
          },
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ThemeUtils.getBackgroundColor1(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.selectedString ?? 'Airtime Type for MTN SERVICE',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),
                ),
              ],
            ),
          ),
        );
      case 'GOTV':
        return GestureDetector(
          onTap: () {
            _openTransactionSelector();
          },
          child: Container(
            padding: EdgeInsets.all(20 - 5),
            decoration: BoxDecoration(
              color: ThemeUtils.getBackgroundColor1(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.selectedString ?? 'Airtime Type for AIRTEL SERVICE',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),
                ),
              ],
            ),
          ),
        );
      case 'STARTIMES':
        return GestureDetector(
          onTap: () {
            _openTransactionSelector();
          },
          child: Container(
            padding: EdgeInsets.all(20 - 5),
            decoration: BoxDecoration(
              color: ThemeUtils.getBackgroundColor1(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.selectedString ?? 'Airtime Type for GLO SERVICE',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),
                ),
              ],
            ),
          ),
        );
      case '9MOBILE':
        return GestureDetector(
          onTap: () {
            _openTransactionSelector();
          },
          child: Container(
            padding: EdgeInsets.all(20 - 5),
            decoration: BoxDecoration(
              color: ThemeUtils.getBackgroundColor1(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.selectedString ?? 'Airtime Type for 9MOBILE SERVICE',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),
                ),
              ],
            ),
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }


  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    controller.fetchCable();
  }
  

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: const Color.fromARGB(251, 252, 251, 251),
        title: Text(
          'Cable Sub',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            width: sizeHorizontal * 10,
            height: sizeVertical * 4,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  controller.next.value = !controller.next.value;
                });
                Timer(Duration(seconds: 2), () {
                  // setState(() {
                  //   Get.to(() => ConfirmationScreen(
                  //     image: networkImage[selectedCable!].toString(),
                  //     to: controller.iucNumber.text,
                  //     amount: controller.amountController.text,
                  //     network: selectedCable!,
                  //     description: _selectedString ?? 'GOTv Joli',
                  //   ));
                  //  next = !next;
                  // });
                  //  controller.fetchCable();
                });
               // controller.fetchCable();
               controller.validateCable();
               //controller.purchaseCableSub();
              },
              child: button(
                text1: 'Next',
                isLoading1: false,
                tap: () {
                  controller.fetchCable();
                },
              ),
            ),
          ),
          SizedBox(width: sizeHorizontal * 2),
        ],
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Obx((){
                    return 
                  controller.next.value
                      ? LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      )
                      : SizedBox.shrink();
                  }),
                  SizedBox(height: sizeVertical * 2),
                  Container(
                    height: sizeVertical * 7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeUtils.getBackgroundColor1(context),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(Icons.wallet, color: kGrey),
                          SizedBox(width: sizeHorizontal * 0.2),
                          Text('Wallect Balance'),
                          Spacer(),
                          Text(
                            '\u20A6${homeScreenController.dashboardModel.data!.walletBalance}',
                            style: Theme.of(
                              context,
                            ).textTheme.headlineLarge?.copyWith(
                              color: Colors.red,
                              fontSize: SizeConfig.blockSizeVertical! * 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: sizeVertical * 1.5),
                  Text(
                    'IUC Number',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 2.0,
                    ),
                  ),
                  SizedBox(height: sizeVertical * 1.5),
              
                  TextField(
                    controller: controller.iucNumber,
                    decoration: InputDecoration(
                      hintText: 'IUC Number',
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 2.0,
                      ),
                      fillColor: ThemeUtils.getBackgroundColor1(context),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 0.1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: sizeVertical * 2),
                  Text(
                    'Select Cable',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 2.0,
                    ),
                  ),
                  SizedBox(height: sizeVertical * 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        networks.map((network) {
                          final isSelected = controller.selectedCable == network;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.selectedCable = network;
                                  //  controller.selectedProvider = network;
                                    
                                  });
                                  filterByProvider(controller.selectedCable!);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.grey.shade200
                                            : networkColors[network], // Colors.blue.shade600 : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Colors.blue.shade800
                                              : Colors.grey.shade400,
                                      width: isSelected ? 2 : 1,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    child: Image.asset(
                                      networkImage[network].toString(),
                                    ),
                                  ),
                                  //Text(network),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
              
                  priceDesc.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Select Cable Pricing',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: SizeConfig.blockSizeVertical! * 2.0,
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
              
                  priceDesc.isNotEmpty
                      ?
                      //TODO: STARTS HERE
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 3,
                          //         childAspectRatio: 0.8,
                          //         crossAxisSpacing: 8,
                          //         mainAxisSpacing: 8,
                          //       ),
                          //       itemCount: plansForSelectedType.length,
                          //       itemBuilder: (context, index) {
                          //         return _buildDataPlanCard(plansForSelectedType[index]);
                          //       },
                          
                           // height: 100,
                            //child:
                             Container(
                               //height: 200,
                               child: GridView.builder(
                                 shrinkWrap: true,
                                 gridDelegate:
                                     SliverGridDelegateWithFixedCrossAxisCount(
                                       crossAxisCount: 3,
                                       childAspectRatio: 0.8,
                                       crossAxisSpacing: 8,
                                       mainAxisSpacing: 8,
                                     ),
                                 itemCount: priceDesc.length,
                                 itemBuilder: (context, index) {
                                   final item = priceDesc[index];
                                   return _buildNumber(
                                     item.cableService,
                                     item.amount,
                                     item.cableService,
                                     item.id,
                                   );
                                 },
                               ),
                             ),
                      //   ,
              
                          ///
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     _buildNumber('DSTV Padi #4000',100),
                          //     _buildNumber('DSTV Padi #4000',200),
                          //     _buildNumber('DSTV Padi #4000',500),
                          //   ],
                          // ),
                          // SizedBox(height: sizeVertical * 2),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     _buildNumber('DSTV Padi #4000',1000),
                          //     _buildNumber('DSTV Padi #4000',5000),
                          //     _buildNumber('DSTV Padi #4000',10000),
                          //   ],
                          // ),
                           SizedBox(height: sizeVertical * 2),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     _buildNumber('DSTV Padi #4000',1000),
                          //     _buildNumber('DSTV Padi #4000',5000),
                          //     _buildNumber('DSTV Padi #4000',10000),
                          //   ],
                          // ),
                          // SizedBox(height: sizeVertical * 2),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     _buildNumber('DSTV Padi #4000',1000),
                          //     _buildNumber('DSTV Padi #4000',5000),
                          //     _buildNumber('DSTV Padi #4000',10000),
                          //   ],
                          // ),
                          // SizedBox(height: sizeVertical * 2),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     _buildNumber('DSTV Padi #4000',1000),
                          //     _buildNumber('DSTV Padi #4000',5000),
                          //     _buildNumber('DSTV Padi #4000',10000),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [_buildNumber(700), _buildNumber(800), _buildNumber(900)],
                          // ),
                          // Row(
                          //   children: [
                          Text(
                            'Amount',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              fontSize: SizeConfig.blockSizeVertical! * 2.0,
                            ),
                          ),
                          //     Spacer(),
                          //     controller.amountController.text.isEmpty ? SizedBox.shrink() : Text(
                          //       '\u20A6${(double.tryParse(controller.amountController.text)! - (double.tryParse(controller.amountController.text)! * 0.05))}',
                          //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          //         fontSize: SizeConfig.blockSizeVertical! * 2.0,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: sizeVertical * 1),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                controller.amountController.text = value;
                              });
                            },
                            controller: controller.amountController,
                            decoration: InputDecoration(
                              //  suffixIcon: Icon(Icons.contacts_rounded, color: kGrey),
                              hintText: 'Amount',
                              hintStyle: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontSize: SizeConfig.blockSizeVertical! * 2.0,
                              ),
                              fillColor: ThemeUtils.getBackgroundColor1(context),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 0.1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                          // Container(),
                          SizedBox(height: sizeVertical * 2),
                          // button(text1: 'Buy Now', isLoading1: false, tap: () {}),
                          // SizedBox(height: sizeVertical * 2),
                        ],
                      ) //TODO: ENDS HERE
                      : SizedBox.shrink(),
                  // Row(children: [
                  //   Container(
                  //     height: sizeVertical * 7,
                  //     width: sizeHorizontal * 7,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       color: kGrey
                  //     ),
                  //   )
                  // ],)
                ],
              ),
            );
      }),
    );
  }

  Widget _buildNumber(String des, double number, String cableService, String cableId){
    return GestureDetector(
      onTap: () {
        controller.amountController.text = number.toString();
        setState(() {
          controller.selectedString = cableService;
          controller.cableId = cableId;
        });
      },
      child: Container(
        //  padding: EdgeInsets.all(12),
        width: SizeConfig.blockSizeHorizontal! * 13,
        height: SizeConfig.blockSizeVertical! * 6.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          color: ThemeUtils.getBackgroundColor(context),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                des,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: SizeConfig.blockSizeVertical! * 1.0,
                ),
              ),
              Text(
                number.toString(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: SizeConfig.blockSizeVertical! * 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
