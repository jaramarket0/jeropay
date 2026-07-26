import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/model/onboarding.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/screens/signin/signin_screen.dart';
import 'package:jeropay/screens/signup_screen/signup_screen.dart';
import 'package:jeropay/widget/button.dart';
import 'package:jeropay/widget/onboarding_navbar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? purple : kLightGrey,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 12, 104).withValues(alpha: 1),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  // flex: 9,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    controller: _pageController,
                    itemCount: onboardingContents.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: sizeVertical * 100,
                            width: sizeVertical * 50,
                            child: Image.asset(
                              onboardingContents[index].img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: sizeVertical * 65,
              right: sizeVertical * 15,
              left: sizeVertical * 15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    currentPage == onboardingContents.length - 1
                        ? 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => AnimatedContainer(
                                  margin: const EdgeInsets.only(right: 8),
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: kYellow,
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                  ),
                                  duration: const Duration(milliseconds: 400),
                                ),
                              ),
                            ),
                          ],
                        )
                        : 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => dotIndicator(index),
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingNavBar(
                      name: 'Skip',
                      onPressed: () {
                        Get.offAll(() => SigninScreen());
                      },
                      buttonColor: kYellow,
                    ),
                   // Spacer(),
                    currentPage == onboardingContents.length - 1
                        ? OnboardingNavBar(
                            name: 'Get Started',
                            onPressed: () {
                              Get.offAll(() => SignupScreen());
                            },
                            buttonColor: kYellow,
                          )
                        : OnboardingNavBar(
                            name: 'Next',
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeOut,
                              );
                            },
                            buttonColor: kYellow,
                          ),
                  ],
                ),
              ),
            ),
            currentPage == onboardingContents.length - 1 ?
            Positioned(
              bottom: sizeVertical * 2,
              left: sizeVertical * 4,
              right: sizeVertical * 4, 
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: sizeVertical * 16,
                      child: GestureDetector(
                        onTap: () => Get.offAllNamed('/signin_screen'),
                        child: button(text1: 'Sign in', isLoading1: false, tap: (){
                          Get.offAllNamed('/signin_screen');
                        }),
                      )),
                    SizedBox(
                      width: sizeVertical * 16,
                      child: GestureDetector(
                        onTap: () => Get.offAllNamed('/signup_screen'),
                        child: button(text1: 'Sign up', isLoading1: false, tap: (){
                          Get.offAllNamed('/signup_screen');
                        }),
                      )),
                  ],
                ),
              ),
            ): SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
