import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final Uri groupUrl = Uri.parse('https://chat.whatsapp.com/H0Kw3da7KIV39iX3AO1CJR?mode=ac_t');
  final Uri adminUrl = Uri.parse('https://wa.me/message/ANY4CTLLYEJBF1');
  final Uri facebookUrl = Uri.parse('https://www.facebook.com/profile.php?id=61571681096338');
  final Uri url = Uri.parse('https://jeropay.com.ng');

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Support',
          style: kEncodeSansBold.copyWith(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Color(0xff332052),
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 2),
        children: [
          SizedBox(height: sizeVertical * 2),
          Container(
            height: sizeVertical * 20,
            width: sizeHorizontal * 25,
            decoration: BoxDecoration(color: Colors.grey.withValues(alpha: .1)),
            child: Image.asset('assets/images/support.png', fit: BoxFit.cover),
          ),
          SizedBox(height: sizeVertical * 2),
          Text(
            'What assistance can we offer you?',
            textAlign: TextAlign.center,
            style: kEncodeSansBold.copyWith(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Color(0xff332052),
              fontSize: SizeConfig.blockSizeVertical! * 2.5,
            ),
          ),
          SizedBox(height: sizeVertical * 2),
          Text(
            'we are dedidcated to ensuring that you have the best experience with our services. If you have any questions, concerns, or feedback, please don\'t hesitate to reach out to us. Our support team is here to assist you with any issues you may encounter.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: SizeConfig.blockSizeVertical! * 1.7,
            ),
          ),
          SizedBox(height: sizeVertical * 2),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(adminUrl)) {
                    throw Exception('could\'t load link $url');
                  }
                },
                child: Container(
                  height: sizeVertical * 17,
                  width: sizeHorizontal * 18,
                  //  height: sizeVertical * 20,

                  // width: sizeHorizontal * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhite,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: sizeVertical * 2.5),
                      SvgPicture.asset(
                        'assets/images/whatsApp.svg',
                        height: sizeVertical * 5,
                        width: sizeHorizontal * 5,
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'WhatsApp',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'Message Us.',
                        style: kEncodeSansSmall.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(groupUrl)) {
                    throw Exception('could\'t load link $url');
                  }
                },
                child: Container(
                  height: sizeVertical * 17,
                  width: sizeHorizontal * 18,
                  //  height: sizeVertical * 20,
                  // width: sizeHorizontal * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhite,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: sizeVertical * 2.5),
                      SvgPicture.asset(
                        'assets/images/whatsApp.svg',
                        height: sizeVertical * 5,
                        width: sizeHorizontal * 5,
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'WhatsApp Group',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'Join Now.',
                        style: kEncodeSansSmall.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: sizeVertical * 2),
          //assets/images/facebook.svg
          Row(
            children: [
              GestureDetector(
                onTap: ()async {
if (!await launchUrl(facebookUrl)) {
                    throw Exception('could\'t load link $url');
                  }
                },
                child: Container(
                  height: sizeVertical * 17,
                  width: sizeHorizontal * 18,
                  //  height: sizeVertical * 20,
                
                  // width: sizeHorizontal * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhite,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: sizeVertical * 2.5),
                      SvgPicture.asset(
                        'assets/images/facebook.svg',
                        height: sizeVertical * 5,
                        width: sizeHorizontal * 5,
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'Facebook Page',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'Follow Now.',
                        style: kEncodeSansSmall.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(url)) {
                    throw Exception('could\'t load link $url');
                  }
                },
                child: Container(
                  //assets/images/logo-1.png
                  height: sizeVertical * 17,
                  width: sizeHorizontal * 18,
                  //  height: sizeVertical * 20,
                  // width: sizeHorizontal * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhite,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: sizeVertical * 2.5),
                      Image.asset(
                        'assets/images/logo-1.png',
                        height: sizeVertical * 5,
                        width: sizeHorizontal * 5,
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'Our Website',
                        style: kEncodeSansSemiBold.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Text(
                        'Visit Now.',
                        style: kEncodeSansSmall.copyWith(
                          color: Color(0xff332052),
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: sizeVertical * 2),
        ],
      ),
    );
  }
}
