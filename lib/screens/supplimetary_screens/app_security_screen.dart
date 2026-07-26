import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/account/controller/account_controller.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/screens/signup_screen/controller/signup_controller.dart';
import 'package:jeropay/screens/supplimetary_screens/confirm_transction_pin_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:jeropay/config/app_toast.dart';

class AppSecurityScreen extends StatefulWidget {
  const AppSecurityScreen({super.key});

  @override
  State<AppSecurityScreen> createState() => _AppSecurityScreenState();
}

class _AppSecurityScreenState extends State<AppSecurityScreen> {
  late SignupController controller;
  late AccountController accountController;
  String _pin = '';
  final int _pinLength = 5;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SignupController>();
    accountController = Get.put(AccountController());
        setPin();
    authenticateUser();
  }
var securityPin;
bool canAuthenticate = false;
final LocalAuthentication auth = LocalAuthentication();

// @override
//   void initState() {
//     super.initState();
//     setPin();
//     authenticateUser();
//   }
Future<bool> _authenticateUser() async {
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
         // Navigator.pop(Get.context!); // Close the confirmation screen
          AppToast.success('User authenticated successfully.');
          Get.offAllNamed('/main_screen');
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


void setPin() async{
var pin1 = await dataBase.getTransactionPin();
print(pin1);
setState(() {
  securityPin = pin1;
});
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
    // setState(() {
    //   controller.pin = _pin;
    //   _pin = '';
    // });
    if(_pin == securityPin){

    AppToast.success('Nice to have you Back!!!');
    
    Get.offAllNamed('/main_screen');
    }else{
      setState(() {
      controller.pin = _pin;
      _pin = '';
    });
        AppToast.error('Pin Not Recognised!!!');
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
           // SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: sizeHorizontal * 10,
                      height: sizeVertical * 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.5, color: Colors.black),
                        color: Color(0xff5f2e96).withValues(alpha: 0.1),
                      ),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Image.asset('assets/images/3d-rendering-zoom-call-avatar-removebg-preview.png',scale: 1,)),
                    ),
                  SizedBox(height: sizeVertical * 2),
                  Text(
                    'Enter Pin.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _pin.length > index ? Color(0xff332052) : Colors.grey,
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
                          _buildFIngerPrint(),
                          //_buildNumberButton(''),
                          // Spacer(),
                          _buildNumberButton('0'),
                          _buildBackspaceButton(),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                      //  Get.offAllNamed('/signin_screen');
                      accountController.logOut();
                      },
                     child:  Text('Sign Out',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 2,))),
                      SizedBox(height: sizeVertical * 2,)
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
              child: Icon(Icons.chevron_left, color:Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff332052), size: 24),
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
