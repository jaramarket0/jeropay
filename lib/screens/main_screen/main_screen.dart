import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/local_storage.dart';
import 'package:jeropay/screens/account/account_screen.dart';
import 'package:jeropay/screens/home_screen/home_screen.dart';
import 'package:jeropay/screens/transaction/transaction_screen.dart';
import 'package:jeropay/screens/wallet_history/wallet_history.dart';
import 'package:jeropay/widget/custom_bottom_nav.dart';

DataBase dataBase = Get.find<DataBase>();
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  Widget _getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const TransactionScreen();
      case 2:
        return const WalletHistoryScreen();
      case 3:
        return const AccountScreen();
      default:
        return const HomeScreen(); 
    }
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: _getCurrentScreen(),
        bottomNavigationBar: CustomBottomNav(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
      );
  }
}