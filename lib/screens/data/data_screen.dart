// import 'package:flutter/material.dart';
// import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
// import 'package:get/get.dart';
// import 'package:jeropay/config/app_style.dart';
// import 'package:jeropay/config/size_config.dart';
// import 'package:jeropay/config/themeUtils.dart';
// import 'package:jeropay/screens/data/confirmation.dart';
// import 'package:jeropay/screens/data/controller/data_controller.dart';
// import 'package:jeropay/widget/button.dart';

// DataController controller = Get.put(DataController());

// class DataScreen extends StatefulWidget {
//   const DataScreen({super.key});

//   @override
//   State<DataScreen> createState() => _DataScreenState();
// }

// class _DataScreenState extends State<DataScreen> {
//  final List<String> networks = <String>['MTN', 'AIRTEL', 'GLO', '9MOBILE'];
//   final Map<String, String> networkImage = {
//     'MTN': 'assets/images/mtn.png',
//     'AIRTEL': 'assets/images/airtel.png',
//     'GLO': 'assets/images/glo.png',
//     '9MOBILE': 'assets/images/9mobile.png',
//   };
//   final Map<String, Color> networkColors = {
//     'MTN': Color(0xffffd700),
//     'AIRTEL': Color(0xffff0000),
//     'GLO': Color(0xff00ff00),
//     '9MOBILE': Color(0xff800080),
//   };
//   String? selectedNetwork;

//   String? _selectedString;

//   final FlutterNativeContactPicker _picker = FlutterNativeContactPicker();
//   String? selectedNumber;

//  String cleanNUmber(String number) {
//     String cleanedNumber = number.replaceAll(RegExp(r'[^0-9]'), '');

//     if (cleanedNumber.startsWith('234')) {
//       cleanedNumber = "0${cleanedNumber.substring(3)}";
//     } else if (cleanedNumber.startsWith('234') == false &&
//         cleanedNumber.startsWith('0')) {
//       cleanedNumber = "0$cleanedNumber";
//     }

//     return cleanedNumber;
   
//   }

//   Future<void> _pickPhoneNumber() async {
//       final contact = await _picker.selectPhoneNumber();
//       setState(() {
//         selectedNumber = contact?.selectedPhoneNumber;
//         selectedNumber = cleanNUmber(selectedNumber!);
//         controller.phoneController.text = selectedNumber!;
//       });
//   }

//   List<String> dataType = <String>['SME', 'GIFTING','CORPORATE GIFTING'];

//   void _openTransactionSelector() async {
//     final selected = await showModalBottomSheet<String>(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       context: context,
//       //showDragHandle: true,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(height: 10),
//               Text(
//                 'Select Data Type',
//                 style: kEncodeSansBold.copyWith(
//                   color: kDarkGrey,
//                   fontSize: SizeConfig.blockSizeVertical! * 2.5,
//                 ),
//               ),
           
//               SizedBox(height: 10),
//               Divider(),
             
//               Flexible(
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   itemCount: dataType.length,
//                   separatorBuilder: (context, index) => Divider(),
//                   itemBuilder: (context, index) {
//                     final type = dataType[index];
//                     return ListTile(
//                       title: Text(
//                         type,
//                         style: kEncodeSansRegular.copyWith(
//                           color: kDarkGrey,
//                           fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                         ),
//                       ),
//                       onTap: () => Navigator.pop(context, type),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//     if (selected != null && selected != _selectedString) {
//       setState(() {
//         _selectedString = selected;
//       });
//     }
//   }

//   Widget getNetworkContent() {
//     switch (selectedNetwork) {
//       case 'MTN':
//         return GestureDetector(
//           onTap: () {
//             _openTransactionSelector();
//           },
//           child: Container(
//             padding: EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               color: ThemeUtils.getBackgroundColor1(context),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _selectedString ?? 'Data Type for MTN SERVICE',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontSize: SizeConfig.blockSizeVertical! * 1.8,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       case 'AIRTEL':
//         return GestureDetector(
//           onTap: () {
//             _openTransactionSelector();
//           },
//           child: Container(
//             padding: EdgeInsets.all(20 - 5),
//             decoration: BoxDecoration(
//               color: ThemeUtils.getBackgroundColor1(context),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _selectedString ?? 'Data Type for AIRTEL SERVICE',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontSize: SizeConfig.blockSizeVertical! * 1.8,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       case 'GLO':
//         return GestureDetector(
//           onTap: () {
//             _openTransactionSelector();
//           },
//           child: Container(
//             padding: EdgeInsets.all(20 - 5),
//             decoration: BoxDecoration(
//               color: ThemeUtils.getBackgroundColor1(context),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _selectedString ?? 'Data Type for GLO SERVICE',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontSize: SizeConfig.blockSizeVertical! * 1.8,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       case '9MOBILE':
//         return GestureDetector(
//           onTap: () {
//             _openTransactionSelector();
//           },
//           child: Container(
//             padding: EdgeInsets.all(20 - 5),
//             decoration: BoxDecoration(
//               color: ThemeUtils.getBackgroundColor1(context),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _selectedString ?? 'Data Type for 9MOBILE SERVICE',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontSize: SizeConfig.blockSizeVertical! * 1.8,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       default:
//         return SizedBox.shrink();
     
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double sizeVertical = SizeConfig.blockSizeVertical!;
//     double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
//     return Scaffold(
//       appBar: AppBar(
//         //  backgroundColor: const Color.fromARGB(251, 252, 251, 251),
//         title: Text(
//           'Data Service',
//           style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//             fontSize: SizeConfig.blockSizeVertical! * 2.5,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         children: [
//           SizedBox(height: sizeVertical * 2),
//           Container(
//             height: sizeVertical * 7,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: ThemeUtils.getBackgroundColor1(context),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Row(
//                 children: [
//                   Icon(Icons.wallet, color: kGrey),
//                   SizedBox(width: sizeHorizontal * 0.2),
//                   Text('Wallect Balance'),
//                   Spacer(),
//                   Text(
//                     '\u20A614.4',
//                     style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                       color: Colors.red,
//                       fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: sizeVertical * 1.5),
//           Text(
//             'Phone Number',
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//               fontSize: SizeConfig.blockSizeVertical! * 2.0,
//             ),
//           ),
//           SizedBox(height: sizeVertical * 1.5),

//           TextField(
//             controller: controller.phoneController,
//             decoration: InputDecoration(
//               suffixIcon: GestureDetector(
//                 onTap: _pickPhoneNumber,
//                 child: Icon(Icons.contacts_rounded, color: kGrey)),
//               hintText: 'Phone Number',
//               hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                 fontSize: SizeConfig.blockSizeVertical! * 2.0,
//               ),
//               fillColor: ThemeUtils.getBackgroundColor1(context),
//               filled: true,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide(width: 0.1, style: BorderStyle.solid),
//               ),
//             ),
//           ),
//           SizedBox(height: sizeVertical * 2),
//           Text(
//             'Select Network',
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//               fontSize: SizeConfig.blockSizeVertical! * 2.0,
//             ),
//           ),
//           SizedBox(height: sizeVertical * 1),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children:
//                 networks.map((network) {
//                   final isSelected = selectedNetwork == network;
//                   return Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedNetwork = network;
//                           });
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 8,
//                             horizontal: 8,
//                           ),
//                           decoration: BoxDecoration(
//                             color:
//                                 isSelected
//                                     ? Colors.grey.shade200
//                                     : networkColors[network], // Colors.blue.shade600 : Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color:
//                                   isSelected
//                                       ? Colors.blue.shade800
//                                       : Colors.grey.shade400,
//                               width: isSelected ? 2 : 1,
//                             ),
//                           ),
//                           child: CircleAvatar(
//                             child: Image.asset(
//                               networkImage[network].toString(),
//                             ),
//                           ),
//                           //Text(network),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//           ),

//           //SizedBox(height: sizeVertical * 2),
//           selectedNetwork != null
//               ? Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Text(
//                   'Select Data Type',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                   ),
//                 ),
//               )
//               : SizedBox.shrink(),
//           // SizedBox(height: sizeVertical * 1),
//           Row(children: [Expanded(child: getNetworkContent())]),

//           // SizedBox(height: sizeVertical * 1),
//           _selectedString != null
//               ? Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Text(
//                   'Choose an amount',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                   ),
//                 ),
//               )
//               : SizedBox.shrink(),

//           _selectedString != null
//               ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       _buildNumber('100mb (gifting)',100,'2DAYS'),
//                       _buildNumber('200mb (gifting)',200,'2DAYS'),
//                       _buildNumber('500mb (gifting)',500,'2DAYS'),
//                     ],
//                   ),
//                   SizedBox(height: sizeVertical * 2),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       _buildNumber('1GB (gifting)',1000,'2DAYS'),
//                       _buildNumber('5GB (gifting)',5000,'2DAYS'),
//                       _buildNumber('10GB (gifting)',10000,'2DAYS'),
//                     ],
//                   ),
//                   SizedBox(height: sizeVertical * 2),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //   children: [_buildNumber(700), _buildNumber(800), _buildNumber(900)],
//                   // ),
//                   Text(
//                     'Amount',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                       fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                     ),
//                   ),
//                   SizedBox(height: sizeVertical * 1),
//                   TextField(
//                     readOnly: true,
//                     onChanged: (value){
//                       setState(() {
//                         controller.amountController.text = value;
//                       });
//                     },
//                     controller: controller.amountController,
//                     decoration: InputDecoration(
//                       //  suffixIcon: Icon(Icons.contacts_rounded, color: kGrey),
//                       hintText: 'Amount',
//                       hintStyle: Theme.of(
//                         context,
//                       ).textTheme.bodyLarge?.copyWith(
//                         fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                       ),
//                       fillColor: ThemeUtils.getBackgroundColor1(context),
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: BorderSide(
//                           width: 0.1,
//                           style: BorderStyle.solid,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(),
//                   SizedBox(height: sizeVertical * 2),
//                   GestureDetector(
//                     onTap: () {
//                       if (controller.amountController.text.isNotEmpty) {
//                         Get.to(() => ConfirmationScreen(
//                           image: networkImage[selectedNetwork!].toString(),
//                           to: controller.phoneController.text,
//                           amount: controller.amountController.text,
//                           network: selectedNetwork!,
//                           description: _selectedString!,
//                         ));
//                       } else {
//                         Get.snackbar(
//                           'Error',
//                           'Please select an amount',
//                           snackPosition: SnackPosition.BOTTOM,
//                         );
//                       }
//                     },
//                     child: button(text1: 'Buy Now', isLoading1: false, tap: () {})),
//                   SizedBox(height: sizeVertical * 2),
//                 ],
//               )
//               : SizedBox.shrink(),
//           // Row(children: [
//           //   Container(
//           //     height: sizeVertical * 7,
//           //     width: sizeHorizontal * 7,
//           //     decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(8),
//           //       color: kGrey
//           //     ),
//           //   )
//           // ],)
//         ],
//       ),
//     );
//   }

//   Widget _buildNumber(String mbdes,int number,String days) {
//     return GestureDetector(
//       onTap: () {
//         controller.amountController.text = number.toString();
//         setState(() {
          
//         });
//       },
//       child: Container(
//         width: SizeConfig.blockSizeHorizontal! * 12,
//         height: SizeConfig.blockSizeVertical! * 10.0,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withValues(alpha: 0.02),
//               spreadRadius: 10,
//               blurRadius: 10,
//               offset: Offset(2, 2),
//             ),
//           ],
//           borderRadius: BorderRadius.circular(8),
//           color: ThemeUtils.getBackgroundColor(context),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 mbdes,
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                   fontSize: SizeConfig.blockSizeVertical! * 1.2,
//                 ),
//               ),
//               Text(
//                 "\u20A6${number}",
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                   fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                 ),
//               ),
//               Text(
//                 days,
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                   fontSize: SizeConfig.blockSizeVertical! * 2.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/data/confirmation.dart';
import 'package:jeropay/screens/data/controller/data_controller.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/widget/button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:jeropay/config/app_toast.dart';

// Data Plan Model
class DataPlan {
  final String id;
  final String amount;
  final String network;
  final String planType;
  final String bandwidth;
  final String networkId;
  final String priceDesc;
  final String dataPlanId;
  final String resellerAmount;

  DataPlan({
    required this.id,
    required this.amount,
    required this.network,
    required this.planType,
    required this.bandwidth,
    required this.networkId,
    required this.priceDesc,
    required this.dataPlanId,
    required this.resellerAmount,
  });

  factory DataPlan.fromJson(Map<String, dynamic> json) {
    return DataPlan(
      id: json['id'],
      amount: json['amount'],
      network: json['network'],
      planType: json['plan_type'],
      bandwidth: json['bandwidth'],
      networkId: json['network_id'],
      priceDesc: json['price_desc'],
      dataPlanId: json['data_plan_id'],
      resellerAmount: json['reseller_amount'],
    );
  }
}

DataController controller = Get.put(DataController());
HomeScreenController homeScreenController = Get.find<HomeScreenController>();


class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final List<String> networks = <String>['MTN', 'AIRTEL', 'GLO', '9MOBILE'];
  final Map<String, String> networkImage = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9MOBILE': 'assets/images/9mobile.png',
  };
  final Map<String, Color> networkColors = {
    'MTN': Color(0xffffd700),
    'AIRTEL': Color(0xffff0000),
    'GLO': Color(0xff00ff00),
    '9MOBILE': Color(0xff800080),
  };
  

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
   fetchDataPlans();
  }
  
  List<DataPlan> allDataPlans = [];
  List<DataPlan> filteredDataPlans = [];
  List<String> availableDataTypes = [];
  bool isLoading = false;
  DataPlan? selectedDataPlan;

  final FlutterNativeContactPicker _picker = FlutterNativeContactPicker();
  String? selectedNumber;

  @override
  void initState() {
    super.initState();
    fetchDataPlans();
  }

  // Fetch data plans from API
  Future<void> fetchDataPlans() async {
    setState(() {
      isLoading = true;
    });
    
    try {
      var token = await dataBase.getToken();
      // Replace with your actual API endpoint
      final response = await http.get(Uri.parse('https://jeropay.com.ng/api/all-data-plans/'),headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      });
      
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          List<DataPlan> plans = (jsonResponse['data'] as List)
              .map((planJson) => DataPlan.fromJson(planJson))
              .toList();
          
          setState(() {
            allDataPlans = plans;
          });
        }
      }
    } catch (e) {
      // Handle error
      AppToast.error('Failed to fetch data plans: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Filter data plans by selected network
  void filterDataPlansByNetwork(String network) {
    setState(() {
      filteredDataPlans = allDataPlans.where((plan) => 
          plan.network.toUpperCase() == network.toUpperCase()).toList();
      
      // Get unique data types for this network
      availableDataTypes = filteredDataPlans
          .map((plan) => plan.planType)
          .toSet()
          .toList();
      
      // Reset selections
      controller.selectedString = null;
      selectedDataPlan = null;
      controller.amountController.clear();
    });
  }

  // Filter data plans by selected data type
  List<DataPlan> getDataPlansByType(String dataType) {
    return filteredDataPlans.where((plan) => 
        plan.planType == dataType).toList();
  }

  String cleanNUmber(String number) {
    String cleanedNumber = number.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedNumber.startsWith('234')) {
      cleanedNumber = "0${cleanedNumber.substring(3)}";
    } else if (cleanedNumber.startsWith('234') == false &&
        cleanedNumber.startsWith('0')) {
      cleanedNumber = "0$cleanedNumber";
    }

    return cleanedNumber;
  }

  Future<void> _pickPhoneNumber() async {
    final contact = await _picker.selectPhoneNumber();
    setState(() {
      selectedNumber = contact?.selectedPhoneNumber;
      selectedNumber = cleanNUmber(selectedNumber!);
      controller.phoneController.text = selectedNumber!;
    });
  }

  void _openTransactionSelector() async {
    if (availableDataTypes.isEmpty) {
      AppToast.info('No data types available for this network');
      return;
    }

    final selected = await showModalBottomSheet<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(
                'Select Data Type',
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
                  itemCount: availableDataTypes.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final type = availableDataTypes[index];
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
        selectedDataPlan = null;
        controller.amountController.clear();
      });
    }
  }

  Widget getNetworkContent() {
    if (controller.selectedNetwork == null) return SizedBox.shrink();
    
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
              controller.selectedString ?? 'Data Type for ${controller.selectedNetwork} SERVICE',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDataPlansGrid() {
    if (controller.selectedString == null) return SizedBox.shrink();
    
    List<DataPlan> plansForSelectedType = getDataPlansByType(controller.selectedString!);
    
    if (plansForSelectedType.isEmpty) {
      return Center(
        child: Text('No data plans available for this type'),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: plansForSelectedType.length,
      itemBuilder: (context, index) {
        return _buildDataPlanCard(plansForSelectedType[index]);
      },
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
          'Data Service',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading 
        ? Center(child: CircularProgressIndicator())
        : SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
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
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                  'Phone Number',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 2.0,
                  ),
                ),
                SizedBox(height: sizeVertical * 1.5),
                TextField(
                  controller: controller.phoneController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _pickPhoneNumber,
                      child: Icon(Icons.contacts_rounded, color: kGrey)),
                    hintText: 'Phone Number',
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 2.0,
                    ),
                    fillColor: ThemeUtils.getBackgroundColor1(context),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 0.1, style: BorderStyle.solid),
                    ),
                  ),
                ),
                SizedBox(height: sizeVertical * 2),
                Text(
                  'Select Network',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 2.0,
                  ),
                ),
                SizedBox(height: sizeVertical * 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: networks.map((network) {
                    final isSelected = controller.selectedNetwork == network;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.selectedNetwork = network;
                            });
                            filterDataPlansByNetwork(network);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.grey.shade200
                                  : networkColors[network],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
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
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
          
                controller.selectedNetwork != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Select Data Type',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: SizeConfig.blockSizeVertical! * 2.0,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Row(children: [Expanded(child: getNetworkContent())]),
          
                controller.selectedString != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Choose a data plan',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: SizeConfig.blockSizeVertical! * 2.0,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
          
                buildDataPlansGrid(),
          
                controller.selectedString != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: sizeVertical * 2),
                          Text(
                            'Amount',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: SizeConfig.blockSizeVertical! * 2.0,
                            ),
                          ),
                          SizedBox(height: sizeVertical * 1),
                          TextField(
                            readOnly: true,
                            controller: controller.amountController,
                            decoration: InputDecoration(
                              hintText: 'Select a data plan above',
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
                          GestureDetector(
                            onTap: () {
                              controller.selectedNetwork = controller.selectedNetwork;
                              if (selectedDataPlan != null) {
                                Get.to(() => ConfirmationScreen(
                                  image: networkImage[controller.selectedNetwork!].toString(),
                                  to: controller.phoneController.text,
                                  amount: selectedDataPlan!.amount,
                                  network: controller.selectedNetwork!,
                                  description: selectedDataPlan!.priceDesc,
                                  dataId: selectedDataPlan!.id
                                  
                                ));
                              } else {
                                AppToast.error('Please select a data plan');
                              }
                            },
                            child: button(text1: 'Buy Now', isLoading1: false, tap: () {}),
                          ),
                          SizedBox(height: sizeVertical * 2),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
        ),
    );
  }

  Widget _buildDataPlanCard(DataPlan plan) {
    final isSelected = selectedDataPlan?.id == plan.id;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDataPlan = plan;
          controller.amountController.text = plan.amount;
        });
      },
      child: Container(
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
          color: isSelected 
              ? Colors.blue.shade100 
              : ThemeUtils.getBackgroundColor(context),
          border: isSelected 
              ? Border.all(color: Colors.blue, width: 2)
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                plan.bandwidth,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: SizeConfig.blockSizeVertical! * 1.2,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                "\u20A6${plan.amount}",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 4),
              Text(
                plan.priceDesc.split('(').last.replaceAll(')', ''),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: SizeConfig.blockSizeVertical! * 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}