// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jeropay/config/app_style.dart';
// import 'package:jeropay/config/size_config.dart';
// import 'package:jeropay/screens/receipt_screen/receipt_screen.dart';
// import 'package:jeropay/screens/transaction/controller/transaction_screen.dart';
// import 'package:jeropay/screens/wallet_history/models/models.dart';
// import 'package:jeropay/widget/card_receipt_history.dart';

// TransactionScreenController controller = Get.put(TransactionScreenController());

// class TransactionScreen extends StatefulWidget {
//   const TransactionScreen({super.key});

//   @override
//   State<TransactionScreen> createState() => _TransactionScreenState();
// }

// class _TransactionScreenState extends State<TransactionScreen> {
//   final List<String> transactionType = <String>[
//     'Data Transactions',
//     'Airtime Transactions',
//     'Cable Transactions',
//     'Electricity Transactions',
//     'Education Pin',
//     'Bulk SMS',
//     'Rechard Card',
//     'Airtime Swap',
//   ];

//   String _selectedString = 'Data Transactions';

//   Widget _buildContent() {
//     switch (_selectedString) {
//       case 'Data Transactions':
//         return DataSubScreen();
//       case 'Airtime Transactions':
//         return AirtimeSubScreen();
//       case 'Cable Transactions':
//         return CableSubScreen();
//       case 'Electricity Transactions':
//         return ElectricitySubScreen();
//       case 'Education Pin':
//         return EducationPinSubScreen();
//       case 'Bulk SMS':
//         return BulkSmsSubScreen();
//       case 'Rechard Card':
//         return RechardCardSubScreen();
//       case 'Airtime Swap':
//         return AirtimeSwapSubScreen();
//       default:
//         return Center(child: Text('No content available'));
//     }
//   }


//   //TODO: HERE

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
//                 'Select Transaction',
//                 style: kEncodeSansBold.copyWith(
//                   color: kDarkGrey,
//                   fontSize: SizeConfig.blockSizeVertical! * 2.5,
//                 ),
//               ),
             
//               SizedBox(height: 10),
//               Divider(),
//               // ...transactionType.map((type){
//               //   return ListTile(
//               //       title: Text(type),
//               //       onTap: () => Navigator.pop(context, type),
//               //     );
//               // })
//               Flexible(
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   itemCount: transactionType.length,
//                   separatorBuilder: (context, index) => Divider(),
//                   itemBuilder: (context, index) {
//                     final type = transactionType[index];
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

//   // ...existing code...

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double sizeVertical = SizeConfig.blockSizeVertical!;
//     double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             _openTransactionSelector();
//           },
//           icon: Icon(Icons.arrow_drop_down),
//         ),
//         title: Text(
//           _selectedString,
//           style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//             fontSize: SizeConfig.blockSizeVertical! * 2.5,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         return controller.isLoading.value
//             ? Center(child: CircularProgressIndicator())
//             : _buildContent();
//       }),
//       //Center(child: Text('Welcome to the Transaction Screen!')),
//     );
//   }
// }

// class DataSubScreen extends StatelessWidget {
//   const DataSubScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Data Transactions Screen',
//         style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//           fontSize: SizeConfig.blockSizeVertical! * 2.5,
//         ),
//       ),
//     );
//   }
// }

// class AirtimeSubScreen extends StatefulWidget {
//   const AirtimeSubScreen({super.key});

//   @override
//   State<AirtimeSubScreen> createState() => _AirtimeSubScreenState();
// }

// class _AirtimeSubScreenState extends State<AirtimeSubScreen> {
//   Map<String, dynamic> networkImageMap = {
//     'MTN': 'assets/images/mtn.png',
//     'AIRTEL': 'assets/images/airtel.png',
//     'GLO': 'assets/images/glo.png',
//     '9 MOBILE': 'assets/images/9mobile.png',
//   };
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
    
//   }

//   setList() {
// List<Data> airtimeLIst1 =
//         controller.transactionList
//             .where((type) => type.type == 'Airtime')
//             .toList();

//             setState(() {
//              airtimeLIst = airtimeLIst1; 
//             });
//   }
//   List<Data> airtimeLIst = [];
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double sizeVertical = SizeConfig.blockSizeVertical!;
//     double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
 
    
//     return ListView.separated(
//       itemBuilder: (context, index) {
//         Data data = airtimeLIst[index];
//         return airtimeLIst.isEmpty
//             ? Center(child: Text('No transaction for airtime yet!!!'))
//             : ReceiptCardHistory(
//               sizeHorizontal: sizeHorizontal,
//               sizeVertical: sizeVertical,
//               index: index,
//               status: data.status!,
//               amount: data.amount!,
//               phoneNumber: data.phoneNumber!,
//               type: data.type!,
//               details: data.detail,
//               networkImage:
//                   networkImageMap[data
//                       .network!], // getImageFromNetwork(data.network!)!,
//               networkName: data.network!,
//               onPressed: () {
//                 Navigator.of(context).push(
//                   CupertinoPageRoute(
//                     builder:
//                         (context) => ReceiptScreen(
//                           networkImage:
//                               networkImageMap[data
//                                   .network!], //getImageFromNetwork(data.network!)!,
//                           networkName: data.network!,
//                           transactionModel: data,
//                         ),
//                   ),
//                 );
               
//               },
//             );
//       },
//       separatorBuilder: (context, index) => SizedBox(height: 10),
//       itemCount: controller.transactionList.length,
//     );
//   }
// }

// class CableSubScreen extends StatelessWidget {
//   const CableSubScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Cable Transactions Screen'));
//   }
// }

// class ElectricitySubScreen extends StatelessWidget {
//   const ElectricitySubScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Electricity Transactions Screen'));
//   }
// }

// class EducationPinSubScreen extends StatelessWidget {
//   const EducationPinSubScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Education Pin Screen'));
//   }
// }

// class BulkSmsSubScreen extends StatelessWidget {
//   const BulkSmsSubScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Bulk SMS Screen'));
//   }
// }

// class RechardCardSubScreen extends StatelessWidget {
//   const RechardCardSubScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Rechard Card Screen'));
//   }
// }

// class AirtimeSwapSubScreen extends StatelessWidget {
//   const AirtimeSwapSubScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Airtime Swap Screen'));
//   }
// }
// 



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/receipt_screen/receipt_screen.dart';
import 'package:jeropay/screens/transaction/controller/transaction_screen.dart';
import 'package:jeropay/screens/wallet_history/models/models.dart';
import 'package:jeropay/widget/card_receipt_history.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

TransactionScreenController controller = Get.put(TransactionScreenController());

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<String> transactionType = <String>[
    'Data Transactions',
    'Airtime Transactions',
    'Cable Transactions',
    'Electricity Transactions',
    'Education Pin',
    'Bulk SMS',
    'Rechard Card',
    'Airtime Swap',
  ];


  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    controller.transactions();
  }

  String _selectedString = 'Data Transactions';

  Widget _buildContent() {
    switch (_selectedString) {
      case 'Data Transactions':
        return DataSubScreen();
      case 'Airtime Transactions':
        return AirtimeSubScreen();
      case 'Cable Transactions':
        return CableSubScreen();
      case 'Electricity Transactions':
        return ElectricitySubScreen();
      case 'Education Pin':
        return EducationPinSubScreen();
      case 'Bulk SMS':
        return BulkSmsSubScreen();
      case 'Rechard Card':
        return RechardCardSubScreen();
      case 'Airtime Swap':
        return AirtimeSwapSubScreen();
      default:
        return Center(child: Text('No content available'));
    }
  }

  void _openTransactionSelector() async {
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
                'Select Transaction',
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
                  itemCount: transactionType.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final type = transactionType[index];
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

    if (selected != null && selected != _selectedString) {
      setState(() {
        _selectedString = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _openTransactionSelector();
            },
            icon: Icon(Icons.arrow_drop_down),
          ),
          title: Text(
            _selectedString,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.5,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : _buildContent();
        }),
      ),
    );
  }
}

class DataSubScreen extends StatefulWidget {
  const DataSubScreen({super.key});

  @override
  State<DataSubScreen> createState() => _DataSubScreenState();
}

class _DataSubScreenState extends State<DataSubScreen> {
  Map<String, dynamic> networkImageMap = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9 MOBILE': 'assets/images/9mobile.png',
  };

  List<Data> dataList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Data')
        .toList();
    setState(() {
      dataList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (dataList.isEmpty) {
      return Center(child: Text('No transaction for data yet!!!'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = dataList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: dataList.length,
      ),
    );
  }
}

class AirtimeSubScreen extends StatefulWidget {
  const AirtimeSubScreen({super.key});

  @override
  State<AirtimeSubScreen> createState() => _AirtimeSubScreenState();
}

class _AirtimeSubScreenState extends State<AirtimeSubScreen> {
  Map<String, dynamic> networkImageMap = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9 MOBILE': 'assets/images/9mobile.png',
  };

  List<Data> airtimeList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Airtime')
        .toList();
    setState(() {
      airtimeList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (airtimeList.isEmpty) {
      return Center(child: Text('No transaction for airtime yet!!!'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = airtimeList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: airtimeList.length,
      ),
    );
  }
}

class CableSubScreen extends StatefulWidget {
  const CableSubScreen({super.key});

  @override
  State<CableSubScreen> createState() => _CableSubScreenState();
}

class _CableSubScreenState extends State<CableSubScreen> {
  Map<String, dynamic> networkImageMap = {
    'DSTV': 'assets/images/dstv.png',
    'GOTV': 'assets/images/gotv.png',
    'STARTIMES': 'assets/images/startimes.png',
  };

  List<Data> cableList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Cable')
        .toList();
    setState(() {
      cableList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (cableList.isEmpty) {
      return Center(child: Text('No transaction for cable yet!!!'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = cableList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: cableList.length,
      ),
    );
  }
}

class ElectricitySubScreen extends StatefulWidget {
  const ElectricitySubScreen({super.key});

  @override
  State<ElectricitySubScreen> createState() => _ElectricitySubScreenState();
}

class _ElectricitySubScreenState extends State<ElectricitySubScreen> {
  Map<String, dynamic> networkImageMap = {
    'AEDC': 'assets/images/aedc.png',
    'EKEDC': 'assets/images/ekedc.png',
    'IKEDC': 'assets/images/ikedc.png',
    'PHED': 'assets/images/phed.png',
  };

  List<Data> electricityList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Electricity')
        .toList();
    setState(() {
      electricityList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (electricityList.isEmpty) {
      return Center(child: Text('No transaction for electricity yet!!!'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = electricityList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: electricityList.length,
      ),
    );
  }
}

class EducationPinSubScreen extends StatefulWidget {
  const EducationPinSubScreen({super.key});

  @override
  State<EducationPinSubScreen> createState() => _EducationPinSubScreenState();
}

class _EducationPinSubScreenState extends State<EducationPinSubScreen> {
  Map<String, dynamic> networkImageMap = {
    'WAEC': 'assets/images/waec.png',
    'NECO': 'assets/images/neco.png',
    'JAMB': 'assets/images/jamb.png',
  };

  List<Data> educationList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Education Pin')
        .toList();
    setState(() {
      educationList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (educationList.isEmpty) {
      return Center(child: Text('No transaction for education pin yet!!!'));
    }

    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = educationList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: educationList.length,
      ),
    );
  }
}

class BulkSmsSubScreen extends StatefulWidget {
  const BulkSmsSubScreen({super.key});

  @override
  State<BulkSmsSubScreen> createState() => _BulkSmsSubScreenState();
}

class _BulkSmsSubScreenState extends State<BulkSmsSubScreen> {
  Map<String, dynamic> networkImageMap = {
    'SMS': 'assets/images/sms.png',
  };

  List<Data> bulkSmsList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Bulk SMS')
        .toList();
    setState(() {
      bulkSmsList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (bulkSmsList.isEmpty) {
      return Center(child: Text('No transaction for bulk SMS yet!!!'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = bulkSmsList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: bulkSmsList.length,
      ),
    );
  }
}

class RechardCardSubScreen extends StatefulWidget {
  const RechardCardSubScreen({super.key});

  @override
  State<RechardCardSubScreen> createState() => _RechardCardSubScreenState();
}

class _RechardCardSubScreenState extends State<RechardCardSubScreen> {
  Map<String, dynamic> networkImageMap = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9 MOBILE': 'assets/images/9mobile.png',
  };

  List<Data> rechardCardList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Rechard Card')
        .toList();
    setState(() {
      rechardCardList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (rechardCardList.isEmpty) {
      return Center(child: Text('No transaction for recharge card yet!!!'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = rechardCardList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: rechardCardList.length,
      ),
    );
  }
}

class AirtimeSwapSubScreen extends StatefulWidget {
  const AirtimeSwapSubScreen({super.key});

  @override
  State<AirtimeSwapSubScreen> createState() => _AirtimeSwapSubScreenState();
}

class _AirtimeSwapSubScreenState extends State<AirtimeSwapSubScreen> {
  Map<String, dynamic> networkImageMap = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9 MOBILE': 'assets/images/9mobile.png',
  };

  List<Data> airtimeSwapList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  setList() {
    List<Data> filteredList = controller.transactionList
        .where((type) => type.type == 'Airtime Swap')
        .toList();
    setState(() {
      airtimeSwapList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    if (airtimeSwapList.isEmpty) {
      return Center(child: Text('No transaction for airtime swap yet!!!'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Data data = airtimeSwapList[index];
          return ReceiptCardHistory(
            sizeHorizontal: sizeHorizontal,
            sizeVertical: sizeVertical,
            index: index,
            status: data.status!,
            amount: data.amount!,
            phoneNumber: data.phoneNumber!,
            type: data.type!,
            details: data.detail,
            networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
            networkName: data.network!,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ReceiptScreen(
                    networkImage: networkImageMap[data.network!] ?? 'assets/images/logo-1.png',
                    networkName: data.network!,
                    transactionModel: data,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: airtimeSwapList.length,
      ),
    );
  }
}