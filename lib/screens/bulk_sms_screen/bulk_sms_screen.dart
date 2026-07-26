import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/bulk_sms_screen/confirmation.dart';
import 'package:jeropay/screens/bulk_sms_screen/controller/bulk_sms_controller.dart';
import 'package:jeropay/widget/button.dart';

BulkSmsController controller = Get.put(BulkSmsController());

class BulkSmsScreen extends StatefulWidget {
  const BulkSmsScreen({super.key});

  @override
  State<BulkSmsScreen> createState() => _BulkSmsScreenState();
}

class _BulkSmsScreenState extends State<BulkSmsScreen> {

Future<void> pickTextFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['txt'],
  );
  if (result != null) {
    // File picked successfully
    File file = File(result.files.single.path!);
    // Do something with the file
    String content = await file.readAsString();

  } else {
    // User canceled the picker
  }
}

  bool isDnd = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(title: Text('Bulk sms screen'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Row(
            spacing: 10,
            children: [
              // CircleAvatar(
              //   backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.5),
              //   child: Icon(CupertinoIcons.shield),
              // ),
              FittedBox(
                child: Text(
                  'Send to DND Numbers.',
                  style:
                  // Theme.of(context).textTheme.headlineLarge?.copyWith(
                  //   color: Color(0xff332052),
                  //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
                  // ),
                  kEncodeSansSemiBold.copyWith(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color(0xff332052),
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),
                ),
              ),
              Spacer(),
              //Icon(Icons.chevron_right_rounded)
              Switch(
                value: isDnd,
                onChanged: (value) {
                  // Handle switch toggle
                  setState(() {
                    isDnd = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: sizeVertical * 2),
          Text('From (Sender Name)'),
          SizedBox(height: sizeVertical * 1.5),
          TextField(
             controller: controller.fromController,
            decoration: InputDecoration(
              hintText: 'From (Sender Name)',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Recipients'), IconButton(
              onPressed: () {
                controller.pickTextFile();
              },
              icon: Icon(Icons.upload),
            )],
          ),
          SizedBox(height: sizeVertical * 1.5),
          TextFormField(
            controller: controller.fileController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Recipients',
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2.0,
              ),
              fillColor: ThemeUtils.getBackgroundColor1(context),
              filled: true,
            ),
          ),
          SizedBox(height: sizeVertical * 2),
          Text('Message'),
          SizedBox(height: sizeVertical * 1.5),
          TextFormField(
            controller: controller.messageController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Message',
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2.0,
              ),
              fillColor: ThemeUtils.getBackgroundColor1(context),
              filled: true,
            ),
          ),
          SizedBox(height: sizeVertical * 2),
          GestureDetector(
            onTap: () {
             Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => ConfirmationScreen(
                  to: controller.fromController.text,
                  amountToPay: '1',
                  amount: '6',
                  description: '\u20A612.0',
image: 'assets/images/networks.jpg',
                  network: controller.fileController.text.split('\n').map((e) => cleanNUmber(e)).toList().length.toString(),
                 // isDnd: isDnd,
                 // cleanedNumbers: controller.getCleanedNumbers(
                  //   controller.fileController.text.split('\n'),
                  //   isDnd
                  // ),
                )
              ));
            },
            child: button(text1: 'Buy Now', isLoading1: false, tap: () {}),
          )
        ],
      ),
    );
  }

  String cleanNUmber(String number){
String cleanedNumber = number.replaceAll(RegExp(r'[^0-9]'), '');


   if (cleanedNumber.startsWith('234')){
cleanedNumber = "0${cleanedNumber.substring(3)}";
      
    } else if (cleanedNumber.startsWith('234') == false && cleanedNumber.startsWith('0')) {
      cleanedNumber = "0$cleanedNumber";
    }

    return cleanedNumber;
    
  }
}
