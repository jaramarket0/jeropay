import 'package:flutter/material.dart';
import 'package:jeropay/config/size_config.dart';

class HotelSuiteScreen extends StatefulWidget {
  const HotelSuiteScreen({super.key});

  @override
  State<HotelSuiteScreen> createState() => _HotelSuiteScreenState();
}

class _HotelSuiteScreenState extends State<HotelSuiteScreen> {
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel suite',style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),),
        centerTitle: true,
      ),
    );
  }
}