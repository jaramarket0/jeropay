import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/electricity_screen/confirmation.dart';
import 'package:jeropay/screens/electricity_screen/controller/electricity_controller.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/widget/button.dart';

ElectricityController controller = Get.put(ElectricityController());
HomeScreenController homeScreenController = Get.find<HomeScreenController>();

class ElectricityScreen extends StatefulWidget {
  const ElectricityScreen({super.key});

  @override
  State<ElectricityScreen> createState() => _ElectricityScreenState();
}

class _ElectricityScreenState extends State<ElectricityScreen> {
  final List<String> networks = <String>['MTN', 'AIRTEL', 'GLO', '9MOBILE'];
  final List<String> meterTypes = <String>['Prepaid', 'Postpaid'];
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


  List<String> airtimeType = <String>[
    'Abuja Electricity',
    'Benin Electricity',
    'Eko Electricity',
    'Enugu Electricity',
    'Eko Electricity',
    'Ibadan Electricity',
    'Ikeja Electricity',
    'Jos Electricity',
    'Kaduna Electricity',
    'Kano Electricity',
    'Port Harcourt',
    'Yola Electricity',
  ];

  List<String> electricityImage = <String>[
    'assets/images/AEDC.png',
    'assets/images/EEDC.png',
    'assets/images/EKEDC.png',
    'assets/images/IBEDC.png',
    'assets/images/JED.png',
    'assets/images/KAEDCO (1).png',
    'assets/images/PHED.png',
    'assets/images/AEDC.png',
    'assets/images/EEDC.png',
    'assets/images/EKEDC.png',
    'assets/images/IBEDC.png',
    'assets/images/JED.png',
  ];

   Map<String, String> electricityImageMap = <String, String>{
  'Abuja Electricity': 'assets/images/AEDC.png',
  'Benin Electricity': 'assets/images/EEDC.png',
  'Eko Electricity': 'assets/images/EKEDC.png',
  'Enugu Electricity': 'assets/images/IBEDC.png',
  'Ibadan Electricity': 'assets/images/JED.png',
  'Ikeja Electricity': 'assets/images/KAEDCO (1).png',
  'Port Harcourt': 'assets/images/PHED.png',
  'Yola Electricity': 'assets/images/YEDC.png',
  'Kaduna Electricity': 'assets/images/KEDC.png',
  'Kano Electricity': 'assets/images/KEDC.png',
  'Jos Electricity': 'assets/images/JEDC.png',
  'Lagos Electricity': 'assets/images/LED.png',
  'Ogun Electricity': 'assets/images/OEDC.png',
  'Osun Electricity': 'assets/images/OEDC.png',
  'Rivers Electricity': 'assets/images/PHED.png',
  'Yobe Electricity': 'assets/images/YEDC.png',
  'Zamfara Electricity': 'assets/images/ZEDC.png',
  };


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
                'Select Disco',
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
                      leading: Container(
                        width: SizeConfig.blockSizeHorizontal! * 5,
                        height: SizeConfig.blockSizeVertical! * 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          // color: networkColors[selectedNetwork ?? 'MTN'],
                        ),
                        child: Image.asset(
                          electricityImage[index],
                          width: SizeConfig.blockSizeHorizontal! * 5,
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                      ),
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
      });
    }
  }

  Widget getNetworkContent() {
    switch (controller.selectedNetwork) {
      case 'MTN':
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
      case 'AIRTEL':
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
      case 'GLO':
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: const Color.fromARGB(251, 252, 251, 251),
        title: Text(
          'Electricity',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
        actions: [SizedBox(width: sizeHorizontal * 10,height: sizeVertical * 4,child: GestureDetector(
          onTap: () {
            // setState(() {
            //   controller.next.value = !controller.next.value;
            // });
            // Handle tap
            // Timer(Duration(seconds: 2), () {
            //   Get.to(() => ConfirmationScreen(
            //     image: electricityImageMap[_selectedString],
            //     to: _selectedString,
            //     amount: controller.amountController.text,
            //     network: controller.meterController.text,
            //     description: _selectedMeterType,
            //   ));
            //   setState(() {
            //     next = !next;
            //   });
            // });
           controller.validateElectricity();
            //controller.purchaseElectricity();
          },
          child: button(text1: 'Next', isLoading1: false, tap: () {})),),SizedBox(width: sizeHorizontal * 2,)],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Obx((){
            return 
          controller.next.value ? LinearProgressIndicator(

              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ) : SizedBox.shrink();
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
            'Select Disco Provider',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.0,
            ),
          ),
          SizedBox(height: sizeVertical * 1.5),

          GestureDetector(
            onTap: () {
              _openTransactionSelector();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: ThemeUtils.getBackgroundColor1(context),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    controller.selectedString ?? 'Select Disco Provider',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 1.8,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_outlined, color: kGrey),
                ],
              ),
            ),
          ),
          SizedBox(height: sizeVertical * 2),
          Text(
            'Meter Number',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.0,
            ),
          ),
          SizedBox(height: sizeVertical * 1.5),
          TextField(
            controller: controller.meterController,
            decoration: InputDecoration(
              // suffixIcon: GestureDetector(
              //   onTap: _pickPhoneNumber,
              //   child: Icon(Icons.contacts_rounded, color: kGrey)),
              hintText: 'Meter Number',
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
            'Select Type',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.0,
            ),
          ),
          SizedBox(height: sizeVertical * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(meterTypes.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.selectedMeterType = meterTypes[index];
                  setState(() {});
                  print(controller.selectedMeterType);
                  print(index);
                },
                //_selectedMeterType!.isNotEmpty && index == meterTypes.indexOf(_selectedMeterType!) ? ThemeUtils.getBackgroundColor(context) : Colors.transparent
                child: 
                
                Container(
                  width: SizeConfig.blockSizeHorizontal! * 19,
                  height: SizeConfig.blockSizeVertical! * 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 5),
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
                    color: meterTypes[index] == controller.selectedMeterType ? Colors.grey : ThemeUtils.getBackgroundColor(context)  ,
                  ),
                  child: Center(
                    child: Text(
                      meterTypes[index],
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 2.0,
                      ),
                    ),
                  ),
                ),
              );
            }),
           
          ),

        
          controller.selectedNetwork != null
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Select Airtime Type',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 2.0,
                  ),
                ),
              )
              : SizedBox.shrink(),
          // SizedBox(height: sizeVertical * 1),
          Row(children: [Expanded(child: getNetworkContent())]),

          // SizedBox(height: sizeVertical * 1),
          controller.selectedString != null
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Choose an amount',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 2.0,
                  ),
                ),
              )
              : SizedBox.shrink(),

          controller.selectedString != null
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNumber(100),
                      _buildNumber(200),
                      _buildNumber(500),
                    ],
                  ),
                  SizedBox(height: sizeVertical * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNumber(1000),
                      _buildNumber(5000),
                      _buildNumber(10000),
                    ],
                  ),
                  SizedBox(height: sizeVertical * 2),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [_buildNumber(700), _buildNumber(800), _buildNumber(900)],
                  // ),
                  Row(
                    children: [
                      Text(
                        'Amount',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: SizeConfig.blockSizeVertical! * 2.0,
                        ),
                      ),
                      Spacer(),
                      controller.amountController.text.isEmpty
                          ? SizedBox.shrink()
                          : Text(
                            '\u20A60.00',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              fontSize: SizeConfig.blockSizeVertical! * 2.0,
                            ),
                          ),
                    ],
                  ),
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
                  Container(),
                  SizedBox(height: sizeVertical * 2),
                  // button(text1: 'Buy Now', isLoading1: false, tap: () {}),
                  // SizedBox(height: sizeVertical * 2),
                ],
              )
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
  }

  Widget _buildNumber(int number) {
    return GestureDetector(
      onTap: () {
        controller.amountController.text = number.toString();
        setState(() {});
        print(number);
      },
      child: Container(
        width: SizeConfig.blockSizeHorizontal! * 12,
        height: SizeConfig.blockSizeVertical! * 5.0,
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
          color: controller.amountController.text.isNotEmpty && 
                 int.tryParse(controller.amountController.text) == number 
                 ? Colors.grey 
                 : ThemeUtils.getBackgroundColor(context),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.0,
            ),
          ),
        ),
      ),
    );
}

  Widget _buildMeterType(String number) {
    return GestureDetector(
      onTap: () {
        controller.selectedMeterType = number.toString();
        setState(() {});
      },
      child: Container(
        width: double.infinity,  //SizeConfig.blockSizeHorizontal! * 15,
        height: SizeConfig.blockSizeVertical! * 5.0,
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
          child: Text(
            number.toString(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
