import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BulkSmsController extends GetxController {
  

TextEditingController fileController = TextEditingController();
TextEditingController fromController = TextEditingController();
TextEditingController messageController = TextEditingController();
  RxBool isDnd = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data or state here
  }

  Future<void> pickTextFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );
    if (result != null) {
      // File picked successfully
      File file = File(result.files.single.path!);
      String content = await file.readAsString();
      fileController.text = content; // Store the content in the controller
    } else {
      // User canceled the picker
    }
  }

}