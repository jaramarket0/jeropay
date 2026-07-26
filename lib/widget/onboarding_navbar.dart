import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';

class OnboardingNavBar extends StatelessWidget {
  const OnboardingNavBar(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.buttonColor});
  final String name;
  final VoidCallback onPressed;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          
          style: 
          Theme.of(context).textTheme.displaySmall?.copyWith(
          color:kWhite,        
                  fontSize: SizeConfig.blockSizeVertical! * 2.0,
                ),
        ),
      ),
    );
  }
}
