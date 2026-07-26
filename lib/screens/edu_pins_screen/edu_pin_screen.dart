import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/edu_pins_screen/confirmation_screen.dart';
import 'package:jeropay/screens/edu_pins_screen/controller/edu_pins_controller.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/widget/button.dart';

EduPinsController controller = Get.put(EduPinsController());
HomeScreenController homeScreenController = Get.find<HomeScreenController>();

class EduPinScreen extends StatefulWidget {
  const EduPinScreen({super.key});

  @override
  State<EduPinScreen> createState() => _EduPinScreenState();
}

class _EduPinScreenState extends State<EduPinScreen> {
  final List<String> networks = <String>['WAEC', 'NECO', 'NABTEB'];
  final List<int> price = <int>[3900, 1500, 1000];
  final Map<String, int> priceMap = {'WAEC': 3900,'NECO': 1500,'NABTEB': 1000};
  final Map<String, String> networkImage = {
    'WAEC': 'assets/images/weac.png',
    'NECO': 'assets/images/neco.png',
    'NABTEB': 'assets/images/nabtab.png',
  };
  final Map<String, Color> networkColors = {
    'WAEC': Colors.white,
    'NECO': Colors.white,
    'NABTEB': Colors.white,
  };
  

  int? selectedPrice;

  String? _selectedString;

  List<String> airtimeType = <String>['AWUF', 'VTU'];
void updatePrice(int price){
  if(controller.quantityController.text.isNotEmpty){
controller.amountController.text = (price * int.parse(controller.quantityController.text)).toString(); 
  }
 
}
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
    if (selected != null && selected != _selectedString) {
      setState(() {
        _selectedString = selected;
      });
    }
  }

  Widget getNetworkContent() {
    switch (controller.selectedExam) {
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
                  _selectedString ?? 'Airtime Type for MTN SERVICE',
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
                  _selectedString ?? 'Airtime Type for AIRTEL SERVICE',
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
                  _selectedString ?? 'Airtime Type for GLO SERVICE',
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
                  _selectedString ?? 'Airtime Type for 9MOBILE SERVICE',
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
          'Education Pin',
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
            'Select Exam',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.0,
            ),
          ),
          SizedBox(height: sizeVertical * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                networks.map((network) {
                  final isSelected = controller.selectedExam == network;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.selectedExam = network;
                          selectedPrice = priceMap[network];
                          print(selectedPrice);
                          updatePrice(selectedPrice!);
                          if(controller.quantityController.text != ''){

                          }
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
          SizedBox(height: sizeVertical * 2),
          Text(
            'Quantity',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 2.0,
            ),
          ),
          SizedBox(height: sizeVertical * 1.5),

          TextField(
            controller: controller.quantityController,
            onChanged: (value){
              if(selectedPrice != null){
              controller.amountController.text = (selectedPrice! * int.parse(controller.quantityController.text)).toString();
              }
              if(value.isEmpty){
                controller.amountController.text = '';
              }
              setState(() {
                
              });
            },
            decoration: InputDecoration(
              hintText: 'Quantity',
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

          selectedPrice != null
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Amount',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: SizeConfig.blockSizeVertical! * 2.0,
                  ),
                ),
              )
              : SizedBox.shrink(),

          // selectedCable != null
          //     ? Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             _buildNumber('DSTV Padi #4000',100),
          //             _buildNumber('DSTV Padi #4000',200),
          //             _buildNumber('DSTV Padi #4000',500),
          //           ],
          //         ),
          //         SizedBox(height: sizeVertical * 2),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             _buildNumber('DSTV Padi #4000',1000),
          //             _buildNumber('DSTV Padi #4000',5000),
          //             _buildNumber('DSTV Padi #4000',10000),
          //           ],
          //         ),
          //         SizedBox(height: sizeVertical * 2),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             _buildNumber('DSTV Padi #4000',1000),
          //             _buildNumber('DSTV Padi #4000',5000),
          //             _buildNumber('DSTV Padi #4000',10000),
          //           ],
          //         ),
          //         SizedBox(height: sizeVertical * 2),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             _buildNumber('DSTV Padi #4000',1000),
          //             _buildNumber('DSTV Padi #4000',5000),
          //             _buildNumber('DSTV Padi #4000',10000),
          //           ],
          //         ),
          //         SizedBox(height: sizeVertical * 2),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             _buildNumber('DSTV Padi #4000',1000),
          //             _buildNumber('DSTV Padi #4000',5000),
          //             _buildNumber('DSTV Padi #4000',10000),
          //           ],
          //         ),
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         //   children: [_buildNumber(700), _buildNumber(800), _buildNumber(900)],
          //         // ),
          //         // Row(
          //         //   children: [
          //         //     Text(
          //         //       'Amount',
          //         //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //         //         fontSize: SizeConfig.blockSizeVertical! * 2.0,
          //         //       ),
          //         //     ),
          //         //     Spacer(),
          //         //     controller.amountController.text.isEmpty ? SizedBox.shrink() : Text(
          //         //       '\u20A6${(double.tryParse(controller.amountController.text)! - (double.tryParse(controller.amountController.text)! * 0.05))}',
          //         //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //         //         fontSize: SizeConfig.blockSizeVertical! * 2.0,
          //         //       ),
          //         //     ),
          //         //   ],
          //         // ),
          //         // SizedBox(height: sizeVertical * 1),

          //         // SizedBox(height: sizeVertical * 2),
          //       ],
          //     )
          //     : SizedBox.shrink(),
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
        selectedPrice != null ?  TextField(
            readOnly: true,
            onChanged: (value) {
              setState(() {
               // controller.amountController.text = value;
              });
            },
            controller: controller.amountController,
            decoration: InputDecoration(
              //  suffixIcon: Icon(Icons.contacts_rounded, color: kGrey),
              hintText: 'Amount',
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
          ) : SizedBox.shrink(),
          // Container(),
          SizedBox(height: sizeVertical * 2),
          GestureDetector(
            onTap: (){
 
             Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmationScreen(image: networkImage[controller.selectedExam], exam: controller.selectedExam, quantity: controller.quantityController.text, amount: controller.amountController.text)));
            },
            child: button(text1: 'Buy Now', isLoading1: false, tap: () {
             
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildNumber(String des, int number) {
    return GestureDetector(
      onTap: () {
        controller.amountController.text = number.toString();
        setState(() {});
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
