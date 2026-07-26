import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/screens/security/change_pin_confirm.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  String _pin = '';
  String mainPin = '';
  final int _pinLength = 5;
  String securityPin = '';

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

  @override
  void initState() {
    super.initState();
    getPin();
  }

  void _onBackspacePressed() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
      HapticFeedback.lightImpact();
    }
  }

  void getPin() async {
    var pin = await dataBase.getTransactionPin();
    setState(() {
      securityPin = pin;
    });
  }

  void _onPinCompleted() {
    // Handle the completed PIN here, e.g., navigate to another screen or validate the PIN
    print('PIN completed: $_pin');
    // Reset the PIN after completion
    setState(() {
      mainPin = _pin;
      _pin = '';
    });
    if (securityPin == mainPin) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => ChangePinConfirm(pin: mainPin),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Confirm PIN!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.orange,
        ),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Old PIN not Correct!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.orange,
        ),
      );
    }
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
