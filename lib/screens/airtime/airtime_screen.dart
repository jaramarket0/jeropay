import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/airtime/confirmation.dart';
import 'package:jeropay/screens/airtime/controller/airtime_controller.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/widget/button.dart';
import 'package:jeropay/config/app_toast.dart';

AirtimeController controller = Get.put(AirtimeController());
HomeScreenController homeScreenController = Get.find<HomeScreenController>();
class AirtimeScreen extends StatefulWidget {
  const AirtimeScreen({super.key});

  @override
  State<AirtimeScreen> createState() => _AirtimeScreenState();
}

class _AirtimeScreenState extends State<AirtimeScreen> {
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
  

  final FlutterNativeContactPicker _picker = FlutterNativeContactPicker();
  String? selectedNumber;

  Future<void> _pickPhoneNumber() async {
    final contact = await _picker.selectPhoneNumber();
    setState(() {
      selectedNumber = contact?.selectedPhoneNumber;
      selectedNumber = cleanNUmber(selectedNumber!);
      controller.phoneController.text = selectedNumber!;
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: const Color.fromARGB(251, 252, 251, 251),
        title: Text(
          'Airtime Service',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
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
                    '\u20A6${homeScreenController.dashboardModel.data!.wallet!.balance!}',
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
                child: Icon(Icons.contacts_rounded, color: kGrey),
              ),
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
            children:
                networks.map((network) {
                  final isSelected = controller.selectedNetwork == network;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.selectedNetwork = network;
                          });
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

          //SizedBox(height: sizeVertical * 2),
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
                            '\u20A6${(double.tryParse(controller.amountController.text)! - (double.tryParse(controller.amountController.text)! * 0.05))}',
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
                  GestureDetector(
                    onTap: () {
                      if (controller.amountController.text.isEmpty ||
                      controller.phoneController.text.isEmpty ||
                          controller.selectedNetwork == null ||
                          controller.selectedString == null) {
                        AppToast.error('Please select an amount');
                        return;
                      } else if (int.parse(controller.amountController.text) < 100){
                        AppToast.info('Amount must be greater then \u20A6100');
                        return;
                      }
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder:
                              (context) => ConfirmationScreen(
                                image:
                                    networkImage[controller.selectedNetwork!].toString(),
                                network: controller.selectedNetwork!,
                                amountToPay:
                                    (double.tryParse(
                                              controller.amountController.text,
                                            )! -
                                            (double.tryParse(
                                                  controller
                                                      .amountController
                                                      .text,
                                                )! *
                                                0.05))
                                        .toString(),
                                amount: controller.amountController.text,
                                to: controller.phoneController.text,
                                description:
                                    "${controller.selectedNetwork} ${controller.selectedString}",
                              ),
                        ),
                      );

                       
                    },
                    child: button(
                      text1: 'Buy Now',
                      isLoading1: false,
                      tap: () {
                        // controller.buyAirtime(
                        //   context: context,
                        //   network: selectedNetwork!,
                        //   amount: controller.amountController.text,
                        //   phoneNumber: controller.phoneController.text,
                        //   airtimeType: _selectedString!,
                        // );
                       
                      },
                    ),
                  ),
                  SizedBox(height: sizeVertical * 2),
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
