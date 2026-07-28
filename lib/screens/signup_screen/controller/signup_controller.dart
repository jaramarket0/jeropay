import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/screens/signup_screen/models/models.dart';
import 'package:jeropay/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:jeropay/screens/supplimetary_screens/transaction_pin_screen.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;
import 'package:jeropay/config/app_toast.dart';

class SignupController extends GetxController {
  ApiService apiService = ApiService(Duration(seconds: 60 * 5));
  // Define your controller properties and methods here
  var isLoading = false.obs;
  final RxBool isGoogleLoading = false.obs;
  String pin = '';
  String cPin = '';

  RegisterUser registerUser = RegisterUser();
  // void toggleLoading() {
  //   isLoading.value = !isLoading.value;
  // }

  final TextEditingController? fullNameController = TextEditingController();
  final TextEditingController? userNameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? addressController = TextEditingController();
  final TextEditingController? referralController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController!.dispose();
    addressController!.dispose();
    phoneController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    confirmPasswordController!.dispose();
    userNameController!.dispose();
    phoneController!.dispose();
  }

  void signUpWithGoogle() async {
    isGoogleLoading.value = true;
    try {
      // Web needs `clientId` to initialize Google Identity Services;
      // native platforms use `serverClientId` to obtain a server auth code.
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: kIsWeb
            ? '876478177791-bmopjk9ireq1g8eqlus9buml0tcl5l2o.apps.googleusercontent.com'
            : null,
        serverClientId: kIsWeb
            ? null
            : '876478177791-bmopjk9ireq1g8eqlus9buml0tcl5l2o.apps.googleusercontent.com',
      );
      // Do NOT show loader here — the native Google picker is already the UX.
      // Showing an overlay before the native activity causes _dependents.isEmpty crash.
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return; // user cancelled

      _showLoader(); // Safe to show now — Flutter UI is fully back in focus
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final String? idToken = await userCredential.user?.getIdToken();

      if (idToken == null) throw Exception('Failed to get ID token');

      var response = await apiService.googleAuth({'id_token': idToken});
      myLog.log('googleAuth status: ${response.statusCode}');
      myLog.log('googleAuth body: ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = json.decode(response.body);
        dataBase.saveToken(body['token'] as String);
        dataBase.saveUserName(body['username'] as String);
        dataBase.saveEmail((body['email'] as String?) ?? '');
        final profile = body['profile'] as Map<String, dynamic>?;
        final phone = profile?['phone'] as String?;
        if (profile != null) {
          dataBase.saveReferalCode((profile['code'] as String?) ?? '');
          dataBase.saveFullName((profile['fullName'] as String?) ?? '');
          dataBase.savePhoneNumber(phone ?? '');
          dataBase.saveAddress((profile['location'] as String?) ?? '');
        }
        if ((phone ?? '').isEmpty) {
          Navigator.of(Get.context!).push(
            CupertinoPageRoute(builder: (context) => const CompleteProfileScreen()),
          );
        } else {
          Get.offAllNamed('/main_screen');
        }
      } else {
        String errorMsg = 'Google sign-up failed (${response.statusCode})';
        try {
          errorMsg = json.decode(response.body)["message"] ?? errorMsg;
        } catch (_) {
          // response is not JSON (HTML error page or empty body)
        }
        _showErrorSnackbar(errorMsg);
      }
    } on PlatformException catch (e) {
      myLog.log('Google Sign-Up error: ${e.code}');
      if (e.code == 'sign_in_cancelled') return;
      _showErrorSnackbar('Google sign-up failed. Please try again.');
    } catch (e) {
      myLog.log(e.toString());
      _showErrorSnackbar('Google sign-up failed. Please try again.');
    } finally {
      isGoogleLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }

  void _showErrorSnackbar(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      if (Get.overlayContext == null) {
        myLog.log('Snackbar skipped: overlay not available — $message');
        return;
      }
      AppToast.error(message);
    });
  }

  void _showLoader() {
    OverlayLoadingProgress.start(
      circularProgressColor: const Color(0xff5f2e96),
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );
  }

  // Add more methods as needed for signup functionality

  void createUser() async {
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
      //gifOrImagePath: 'assets/images/logo-1.png',
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );

    try {
      Map<String, dynamic> userData = {
        "fullname": fullNameController!.text,
        "username": userNameController!.text,
        "phone": phoneController!.text,
        "address_area": addressController!.text,
        "password": passwordController!.text,
        "email": emailController!.text,
        if (referralController!.text.trim().isNotEmpty)
          "referred_by": referralController!.text.trim(),
      };

      myLog.log(userData.toString());
      var response = await apiService.registerUser(userData);

      if (response.statusCode == 201) {
        myLog.log(response.body);
        registerUser = registerUserFromJson(response.body);
        dataBase.saveToken(registerUser.accessToken!);
        dataBase.saveUserName(registerUser.data!.username!);
        dataBase.saveEmail(registerUser.data!.email!);
         fullNameController!.dispose();
    addressController!.clear();
    phoneController!.clear();
    emailController!.clear();
    passwordController!.clear();
    confirmPasswordController!.clear();
    userNameController!.clear();
    phoneController!.clear();
        AppToast.success('Account Created Successfully');

        Navigator.of(Get.context!).push(
          CupertinoPageRoute(builder: (context) => TransactionPinScreen()),
        );
      }
    } catch (e) {
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }

  void createPin() async {
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
      //gifOrImagePath: 'assets/images/logo-1.png',
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );

    try {
      await dataBase.saveTransactionPin(pin);
      var response = await apiService.transactionPin(pin);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast.success('Pin Created Successfully');
      } else {
        myLog.log('transactionPin API error: ${response.statusCode} ${response.body}');
        AppToast.error('Pin saved locally but server sync failed. Please try again later.');
      }
      Get.offAllNamed('/signin_screen');
    } catch (e) {
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }



  void updatePin(String newPin) async {
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
      //gifOrImagePath: 'assets/images/logo-1.png',
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );

    try {
      var response = await apiService.updateTransactionPin(newPin);
      if (response.statusCode == 200 || response.statusCode == 201) {
        dataBase.saveTransactionPin(newPin);
        AppToast.success('Pin Updated Successfully');
        Get.offAllNamed('/main_screen');
      }
    } catch (e) {
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }



  void updatePinWithPassword(String password,String pin) async {
    var username = await dataBase.getUserName();
    myLog.log(password);
    myLog.log(pin);
    myLog.log(username);
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
      //gifOrImagePath: 'assets/images/logo-1.png',
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );

    try {
      var response = await apiService.updateTransactionPinWithPassword(password,pin);
      if (response.statusCode == 200 || response.statusCode == 201) {
        dataBase.saveTransactionPin(pin);
        AppToast.success('Pin Updated Successfully');
        Get.offAllNamed('/main_screen');
      }
    } catch (e) {
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }



  void updatePassword(String oldPassword, String newPassword) async {
    OverlayLoadingProgress.start(
      circularProgressColor: Color(0xff5f2e96),
      //gifOrImagePath: 'assets/images/logo-1.png',
      widget: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: Color(0xff5f2e96),
              strokeWidth: 3,
            ),
          ),
          Image.asset('assets/images/logo-1.png', width: 40, height: 40),
        ],
      ),
    );

    try {
      var response = await apiService.updatePassword(oldPassword,newPassword);
      if (response.statusCode == 200 || response.statusCode == 201) {
       // dataBase.saveTransactionPin(pin);
        AppToast.success('Password Updated Successfully');
        Get.offAllNamed('/main_screen');
      }else{
        var res = jsonDecode(response.body);
        AppToast.error(res['message']);
      }
    } catch (e) {
      myLog.log(e.toString());
      AppToast.error(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
