import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:local_auth/local_auth.dart';
import 'package:jeropay/config/app_toast.dart';

class ConfirmationScreen extends StatefulWidget {
  final String? image;
  final String? to;
  final String? amountToPay;
  final String? amount;
  final String? network;
  final String? description;
  const ConfirmationScreen({
    super.key,
    this.image,
    this.to,
    this.amountToPay,
    this.amount,
    this.network,
    this.description, 
  });

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final LocalAuthentication auth = LocalAuthentication();
bool canAuthenticate = false;
  @override
  void initState() {
    super.initState();
    authenticateUser();
  }

  Future<bool> _authenticateUser() async {
    // if (authenticated) {
    //   // Proceed with the confirmation action
    //   print('User authenticated successfully');
    // } else {
    //   // Handle authentication failure
    //   print('User authentication failed');
    //   Navigator.pop(context); // Close the confirmation screen
    // }

    if (canAuthenticate) {
      try {
        final bool isAuthenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to confirm transaction',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );

        if (isAuthenticated) {
          // Proceed with the confirmation action
          //  Navigator.pop(context); // Close the confirmation screen
          //print('User authenticated successfully');
          Navigator.pop(Get.context!); // Close the confirmation screen
          AppToast.success('User authenticated successfully.');
        } else {
          // Handle authentication failure
          print('User authentication failed');
          Navigator.pop(Get.context!); // Close the confirmation screen
        }
        return isAuthenticated;
      } catch (e) {
        print('Error during authentication: $e');
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text('Authentication error: $e'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    }
    return false;
  }

  Future<bool> authenticateUser() async {
    //bool authenticated = await authenticateUser();
    bool isBiometricSupported = await auth.isDeviceSupported();
    bool canCheckBiometrics = await auth.canCheckBiometrics;

    if (!isBiometricSupported || !canCheckBiometrics) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            'Biometric authentication is not supported on this device.',
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    setState(() {
      canAuthenticate = true;
    });
    return true;
  }

  String _pin = '';
  final int _pinLength = 5;

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
    Navigator.pop(context);
    // Handle the completed PIN here, e.g., navigate to another screen or validate the PIN
    print('PIN completed: $_pin');
    // Reset the PIN after completion
    setState(() {
      _pin = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PIN changed successfully!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _openTransactionSelector() async {
    final selected = await showModalBottomSheet<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      //showDragHandle: true,
      isScrollControlled: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Transaction Pin',
                        style: kEncodeSansBold.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeVertical! * 2.5,
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
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 15,
                          height: 15,
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
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
                              _buildNumberButton('1', () => setState(() {})),
                              _buildNumberButton('2', () => setState(() {})),
                              _buildNumberButton('3', () => setState(() {})),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildNumberButton('4', () => setState(() {})),
                              _buildNumberButton('5', () => setState(() {})),
                              _buildNumberButton('6', () => setState(() {})),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildNumberButton('7', () => setState(() {})),
                              _buildNumberButton('8', () => setState(() {})),
                              _buildNumberButton('9', () => setState(() {})),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildBackspaceButton(),

                              _buildNumberButton('0', () => setState(() {})),
                              //    SizedBox(width: 15,),
                              //   Padding(
                              //     padding: const EdgeInsets.symmetric(horizontal: 18),
                              //     child: Icon(Icons.fingerprint,size: 30,),
                              //   ),
                              //  SizedBox(width: 15,),
                              _buildFIngerPrint(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: sizeVertical * 20),
              ],
            );
          },
        );
      },
    );
    // if (selected != null && selected != _selectedString) {
    //   setState(() {
    //   //  _selectedString = selected;
    //   });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm',
           style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: sizeHorizontal * 2,
          vertical: sizeVertical * 2,
        ),
        children: [
          Container(
            height: sizeVertical * 6,
            width: sizeHorizontal * 6,
            decoration: BoxDecoration(
              //image: DecorationImage(image: AssetImage('assetName'))
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              widget.image!,
              fit: BoxFit.contain,
              height: sizeVertical * 6,
              width: sizeHorizontal * 3,
            ),
          ),
          SizedBox(height: sizeVertical * 2),
          Container(
            padding: EdgeInsets.all(sizeVertical * 2),
            decoration: BoxDecoration(
              color: Colors.pink.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sender\'s Name:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      widget.to!,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeVertical * 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Unit Amount:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "\u20A6${widget.amount}.0",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeVertical * 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Page:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "${widget.amountToPay}",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeVertical * 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Phone:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      widget.network!,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeVertical * 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "${widget.description}",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: SizeConfig.blockSizeVertical! * 2.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeVertical * 4),
          Align(
            alignment: Alignment.center,
            child: Text('Tap to Confirm your Transaction'),
          ),
          SizedBox(height: sizeVertical * 3),
          GestureDetector(
            onTap: () {
              _openTransactionSelector();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Container(
                  height: sizeVertical * 1.5,
                  width: sizeHorizontal * 1.5,
                  margin: EdgeInsets.symmetric(
                    horizontal: sizeHorizontal * 1.5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: sizeVertical * 2),
        ],
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         'Your action has been confirmed!',
      //         style: TextStyle(fontSize: 24),
      //       ),
      //       const SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         child: const Text('Go Back'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildNumberButton(String number, VoidCallback setState) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: TextButton(
          onPressed: () {
            setState();
            _onNumberPressed(number);
          },
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

  Widget _buildFIngerPrint() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: IconButton(
          onPressed: () {
            print('finger print');
            _authenticateUser();
          },
          icon: Icon(Icons.fingerprint, size: 30),
        ),
      ),
    );
  }
}
