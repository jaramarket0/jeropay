import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_toast.dart';
import 'package:jeropay/screens/supplimetary_screens/transaction_pin_screen.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';

class CompleteProfileController extends GetxController {
  final ApiService _api = ApiService(const Duration(seconds: 30));

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  @override
  void onClose() {
    phoneController.dispose();
    usernameController.dispose();
    addressController.dispose();
    referralController.dispose();
    super.onClose();
  }

  void submit() async {
    final phone = phoneController.text.trim();
    final username = usernameController.text.trim();
    final address = addressController.text.trim();
    final referral = referralController.text.trim();

    if (phone.isEmpty) {
      AppToast.error('Phone number is required');
      return;
    }

    OverlayLoadingProgress.start(circularProgressColor: const Color(0xff5f2e96));
    try {
      final data = <String, dynamic>{
        'phone': phone,
        if (username.isNotEmpty) 'username': username,
        if (address.isNotEmpty) 'address': address,
        if (referral.isNotEmpty) 'referred_by': referral,
      };

      final response = await _api.completeGoogleProfile(data);

      if (response.statusCode == 200) {
        OverlayLoadingProgress.stop();
        AppToast.success('Profile saved!');
        Navigator.of(Get.context!).pushReplacement(
          CupertinoPageRoute(builder: (_) => const TransactionPinScreen()),
        );
      } else {
        OverlayLoadingProgress.stop();
        String msg = 'Profile update failed (${response.statusCode})';
        try {
          final body = json.decode(response.body);
          if (body is Map) msg = body['message']?.toString() ?? msg;
        } catch (_) {}
        AppToast.error(msg);
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      AppToast.error(e.toString());
    }
  }
}
