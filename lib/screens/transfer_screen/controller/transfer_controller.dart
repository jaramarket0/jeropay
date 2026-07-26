import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:jeropay/config/app_toast.dart';

class TransferController extends GetxController {
  ApiService apiService = ApiService(const Duration(seconds: 30));

  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  var isLoading = false.obs;

  @override
  void dispose() {
    recipientController.dispose();
    amountController.dispose();
    pinController.dispose();
    super.dispose();
  }

  void transfer() async {
    final recipient = recipientController.text.trim();
    final amountText = amountController.text.trim();
    final pin = pinController.text.trim();

    if (recipient.isEmpty || amountText.isEmpty || pin.isEmpty) {
      AppToast.error('All fields are required');
      return;
    }

    final amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) {
      AppToast.error('Enter a valid amount');
      return;
    }

    OverlayLoadingProgress.start(
      circularProgressColor: const Color(0xff5f2e96),
      widget: Container(
        width: MediaQuery.of(Get.context!).size.width / 4,
        padding: EdgeInsets.all(MediaQuery.of(Get.context!).size.width / 13),
        child: const AspectRatio(
          aspectRatio: 1,
          child: SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(color: Color(0xff5f2e96)),
          ),
        ),
      ),
    );

    try {
      final response = await apiService.transferFunds({
        'recipient_username': recipient,
        'amount': amount,
        'pin': pin,
      });

      OverlayLoadingProgress.stop();

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        pinController.clear();
        AppToast.success(data['message'] ?? 'Transfer successful');
        Get.back();
      } else {
        final data = jsonDecode(response.body);
        AppToast.error(data['message'] ?? 'Transfer failed');
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      AppToast.error(e.toString());
    }
  }
}
