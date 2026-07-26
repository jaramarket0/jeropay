import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/signup_screen/controller/signup_controller.dart';

class ChangePinConfirm extends StatefulWidget {
  final String pin;
  const ChangePinConfirm({super.key, required this.pin});

  @override
  State<ChangePinConfirm> createState() => _ChangePinConfirmState();
}

class _ChangePinConfirmState extends State<ChangePinConfirm> {
  late SignupController controller;
  String _pin = '';
  final int _pinLength = 5;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SignupController>();
  }

  void _onNumberPressed(String number) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin += number;
      });
      HapticFeedback.lightImpact();

      if (_pin.length == _pinLength) {
        // Handle PIN submission
        print('PIN submitted: $_pin');
        // Reset the PIN after submission
        // setState(() {
        //   _pin = '';
        // });
        _onPinCompleted();
      }
    }
  }

  void _onBackspacePressed() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
      HapticFeedback.lightImpact();
    }
  }

  void _onPinCompleted() {
    // Handle the completed PIN here, e.g., navigate to another screen or validate the PIN
    print('PIN completed: $_pin');
    // Reset the PIN after completion
    print("first pin ${widget.pin}");
    print("second pin $_pin");

    if (_pin != widget.pin) {
      controller.updatePin(_pin);
      return;
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Old pin can\'t be same as new PIN!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
    setState(() {
      _pin = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Change PIN - reset',
      //     style: Theme.of(context).textTheme.headlineLarge?.copyWith(
      //       fontSize: SizeConfig.blockSizeVertical! * 2.5,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: EdgeInsets.all(sizeHorizontal * 2),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reset PIN',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 4,
                    ),
                  ),
                  SizedBox(height: sizeVertical * 2),
                  Text(
                    'Please enter your 5 unique PIN to secure your account.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pinLength, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _pin.length > index
                                ? Color(0xff332052)
                                : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          _pin.length > index ? _pin[index] : '',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildNumberButton('1'),
                          _buildNumberButton('2'),
                          _buildNumberButton('3'),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildNumberButton('4'),
                          _buildNumberButton('5'),
                          _buildNumberButton('6'),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildNumberButton('7'),
                          _buildNumberButton('8'),
                          _buildNumberButton('9'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Expanded(child: Container()),
                          _buildBackspaceButton(),
                          //_buildNumberButton(''),
                          Spacer(),
                          _buildNumberButton('0'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: sizeVertical * 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: TextButton(
          onPressed: () => _onNumberPressed(number),
          style: TextButton.styleFrom(
            // backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          child: Container(
            height: double.infinity,
            child: Center(
              child: Text(
                number,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  // color: Colors.black,
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: TextButton(
          onPressed: _onBackspacePressed,
          style: TextButton.styleFrom(
            // backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          child: Container(
            height: double.infinity,
            child: Center(
              child: Icon(
                Icons.chevron_left,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Color(0xff332052),
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
