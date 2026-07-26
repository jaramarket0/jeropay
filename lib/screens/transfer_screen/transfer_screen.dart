import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/transfer_screen/controller/transfer_controller.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(TransferController());

    InputDecoration _fieldDeco(String label, IconData icon) => InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: purple),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: purple),
          ),
          focusedBorder: kInputBorder,
          border: kInputBorder,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet Transfer',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2.5,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send money to another JeroPay user',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kGrey),
              ),
              const SizedBox(height: 28),

              // Recipient
              TextField(
                controller: controller.recipientController,
                keyboardType: TextInputType.text,
                decoration: _fieldDeco('Recipient Username', Icons.person),
              ),
              const SizedBox(height: 18),

              // Amount
              TextField(
                controller: controller.amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: _fieldDeco('Amount (₦)', Icons.attach_money),
              ),
              const SizedBox(height: 18),

              // PIN
              TextField(
                controller: controller.pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 5,
                decoration: _fieldDeco('Transaction PIN', Icons.lock_outline),
              ),
              const SizedBox(height: 32),

              // Transfer button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.transfer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple,
                    foregroundColor: kWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Obx(() => controller.isLoading.value
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text('Transfer', style: TextStyle(fontSize: 16))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
