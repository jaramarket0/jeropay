import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/complete_profile_screen/complete_profile_controller.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  late CompleteProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CompleteProfileController());
  }

  InputDecoration _inputDec(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: purple),
      labelStyle: kEncodeSansSemiBold.copyWith(color: purple, fontSize: 13),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: purple),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: purple, width: 2),
      ),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Complete Your Profile',
          style: kEncodeSansBold.copyWith(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A few more details',
                style: kEncodeSansBold.copyWith(fontSize: 20, color: purple),
              ),
              const SizedBox(height: 6),
              Text(
                'These help us set up your JeroPay account.',
                style: kEncodeSansMedium.copyWith(color: kDarkGrey, fontSize: 13),
              ),
              const SizedBox(height: 28),

              // Phone — required
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDec('Phone Number *', Icons.phone),
              ),
              const SizedBox(height: 16),

              // Username — optional
              TextField(
                controller: controller.usernameController,
                decoration: _inputDec('Username (optional)', Icons.person),
              ),
              const SizedBox(height: 16),

              // Address — optional
              TextField(
                controller: controller.addressController,
                decoration: _inputDec('Address / Area (optional)', Icons.location_on),
              ),
              const SizedBox(height: 16),

              // Referral — optional
              TextField(
                controller: controller.referralController,
                decoration: _inputDec('Referral Code (optional)', Icons.card_giftcard),
              ),
              const SizedBox(height: 36),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple,
                    foregroundColor: kWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: kEncodeSansBold.copyWith(fontSize: 15, color: kWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
