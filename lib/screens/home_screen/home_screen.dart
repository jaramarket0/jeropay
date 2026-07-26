import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:jeropay/config/ThemeController.dart';
import 'package:jeropay/config/app_style.dart';
// import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/config/themeUtils.dart';
import 'package:jeropay/screens/home_screen/controller.dart/home_screen_controller.dart';
import 'package:jeropay/screens/home_screen/model/models.dart';
import 'package:jeropay/screens/notifications/notification_controller.dart';
import 'package:jeropay/screens/notifications/notification_screen.dart';
import 'package:jeropay/screens/supplimetary_screens/add_money.dart';
import 'package:jeropay/widget/card_receipt.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

final themeController = Get.find<ThemeController>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenController controller;
  int _currentIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = Get.put(HomeScreenController());
  // }
  // Controller for the carousel
  late CarouselSliderController carouselController;
  late CarouselSliderController carouselController1;
  List<String> servicesName = <String>[
    'Airtime',
    'Data',
    'Cable',
    'Electricity',
    'Bulk SMS',
    'Edu Pins',
    'Transfer',
    'Community',
  ];

  List<String> routeScreens = <String>[
    '/airtime_screen',
    '/data_screen',
    '/cable_screen',
    '/electricity_screen',
    '/bulk_sms_screen',
    '/edu_pins_screen',
    '/transfer_screen',
    '/community_screen',
  ];

  List<String> networkName = <String>['MTN', 'AIRTEL', 'GLO', '9 MOBILE'];

  Map<String, dynamic> networkImage = {
    'MTN': 'assets/images/mtn.png',
    'AIRTEL': 'assets/images/airtel.png',
    'GLO': 'assets/images/glo.png',
    '9 MOBILE': 'assets/images/9mobile.png',
  };

  List<String> bankName = <String>[
    'Wema Bank',
    'Monie Point',
    '9Payment Service',
    'Palmpay',
  ];

  List<String> bankNumber = <String>[
    '0979485432',
    '8493858944',
    '8439850934',
    '8394029354',
  ];

  void _copyToClipboard(String text, String type) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$type copied to clipboard'),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xff332052),
      ),
    );
  }

  List<IconData> serviceIcons = <IconData>[
    Icons.phone_android_rounded,
    // Icons.network_wifi_rounded,
    CupertinoIcons.wifi,
    Icons.satellite_alt_rounded,
    Icons.cable_outlined,
    Icons.message_rounded,
    Icons.school_rounded,
    Icons.send_rounded,
    CupertinoIcons.house_alt_fill,
  ];

  @override
  void initState() {
    super.initState();
    carouselController = CarouselSliderController();
    carouselController1 = CarouselSliderController();
    controller = Get.put(HomeScreenController());
  }

  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() {
    controller.dashboard();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.02),
      appBar: AppBar(
        backgroundColor: Color(0xff5f2e96).withValues(alpha: 0.02),
        title: Row(
          spacing: 5,
          children: [
            Container(
              width: sizeVertical * 5,
              height: sizeHorizontal * 5,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.black),
                color: Colors.pink.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Transform.scale(
                scale: 1.5,
                child: Image.asset(
                  'assets/images/3d-rendering-zoom-call-avatar-removebg-preview.png',
                  scale: 1,
                ),
              ),
            ),
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.isLoading.value
                      ? SizedBox.shrink()
                      : controller.dashboardModel.status == 'success'
                      ? Text(
                        'Welcome 👋',
                        style: kEncodeSansRegular.copyWith(
                          color: Colors.grey,
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                        ),
                      )
                      : SizedBox.shrink(),
                  controller.dashboardModel.status != 'success'
                      ? SizedBox.shrink()
                      : Text(
                        controller.dashboardModel.data!.profile!.username ?? '',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                        ),
                      ),
                ],
              );
            }),
          ],
        ),
        actions: [
          GetX<NotificationController>(
            init: NotificationController(),
            builder: (nc) => Stack(
              children: [
                IconButton(
                  icon: const Icon(CupertinoIcons.bell),
                  onPressed: () => Navigator.of(context).push(
                    CupertinoPageRoute(builder: (_) => const NotificationScreen()),
                  ),
                ),
                if (nc.unreadCount.value > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        nc.unreadCount.value > 9 ? '9+' : '${nc.unreadCount.value}',
                        style: const TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10), child: ThemeSwitch()),
        ],
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.dashboardModel.status != 'success'
            ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Something went wrong, check internet connect and drag down to refresh.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
            : SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: sizeHorizontal * 14,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                              'assets/images/background.png',
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.3,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gradient: LinearGradient(
                            colors: [Color(0xff5f2e96), Color(0xff332052)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Wallet Balance',
                                  style: kEncodeSansSmall.copyWith(
                                    color: kWhite,
                                    fontSize: SizeConfig.blockSizeVertical! * 2,
                                  ),
                                ),
                                SizedBox(width: 4),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.isHide.value =
                                          !controller.isHide.value;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 15,
                                    color: kWhite,
                                  ),
                                ),
                                Spacer(),
                                controller.isHide.value
                                    ? SizedBox.shrink()
                                    : Text(
                                      'Bonus:',
                                      style: kEncodeSansSmall.copyWith(
                                        color: kWhite,
                                        fontSize:
                                            SizeConfig.blockSizeVertical! * 2,
                                      ),
                                    ),
                                Text(
                                  controller.isHide.value
                                      ? '***'
                                      : ' \u20A6${controller.dashboardModel.data?.wallet?.commissionBalance ?? '0.0'}',
                                  style: kEncodeSansMedium.copyWith(
                                    color: kWhite,
                                    fontSize: SizeConfig.blockSizeVertical! * 2,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: sizeVertical * 0.1,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                controller.isHide.value
                                    ? '***'
                                    : '\u20A6${controller.dashboardModel.data!.walletBalance!}',
                                style: kEncodeSansBold.copyWith(
                                  color: kWhite,
                                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                                ),
                              ),
                            ),
                            //SizedBox(height: sizeVertical * 0.5,),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) => const AddMoney(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: sizeHorizontal * 14,
                                  height: sizeVertical * 4.5,
                                  decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Color(0xff332052),
                                      ),
                                      Text(
                                        'Add Funds',
                                        style: kEncodeSansMedium.copyWith(
                                          color: Color(0xff332052),
                                          fontSize:
                                              SizeConfig.blockSizeVertical! *
                                              1.7,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1.5),
                      //TODO: STARTS HERE
                      CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: sizeVertical * 10,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 800,
                          ),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: [
                          Container(
                            //  height:154,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 154,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                  'assets/images/IMG-1.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            //  height:154,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 154,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                  'assets/images/IMG-2.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            //  height:154,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 154,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                  'assets/images/IMG-3.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            //  height:154,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 154,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                  'assets/images/IMG-4.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                      // dotIndicator(_currentIndex,5)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(
                            4,
                            (index) => GestureDetector(
                              onTap: () {
                                carouselController.animateToPage(index);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: _currentIndex == index ? 20.0 : 7.0,
                                height: 5.0,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color:
                                      _currentIndex == index
                                          ? Color(0xff332052)
                                          : Colors.grey.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      //TODO: ENDS HERE
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        width: double.infinity,
                        height: sizeVertical * 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ThemeUtils.getBackgroundColor(context),
                          //const Color.fromARGB(240, 252, 251, 251),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.08),
                              blurRadius: 5,
                              offset: Offset(2, 2),
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 8,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 9.0,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(routeScreens[index]);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(height: sizeVertical * 1.2),
                                  Container(
                                    width: sizeHorizontal * 5,
                                    height: sizeVertical * 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(
                                        0xff5f2e96,
                                      ).withValues(alpha: 0.3),
                                    ),
                                    child: Icon(
                                      serviceIcons[index],
                                      size: 20,
                                      color: Color(
                                        0xff5f2e96,
                                      ).withValues(alpha: 1),
                                    ),
                                  ),
                                  SizedBox(height: sizeVertical * 1),
                                  FittedBox(
                                    child: Text(
                                      servicesName[index],
                                      style: Theme.of(
                                        context,
                                      ).textTheme.displaySmall?.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeVertical! * 1.5,
                                      ),
                                      // kEncodeSansRegular.copyWith(
                                      //   color: kBrown,
                                      //   fontSize: SizeConfig.blockSizeVertical! * 1.5,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: sizeVertical * 2),
                      Obx(() {
                        controller.isLoading.value; // reactive trigger — re-renders when data loads
                        final accounts = controller.dashboardModel.data?.virtualAccounts ?? [];
                        if (accounts.isEmpty) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xff332052).withValues(alpha: 0.3)),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.account_balance_outlined, size: 32, color: Colors.grey),
                                const SizedBox(height: 8),
                                Text(
                                  'No virtual accounts yet',
                                  style: kEncodeSansMedium.copyWith(color: kDarkGrey, fontSize: 13),
                                ),
                                const SizedBox(height: 12),
                                Obx(() => SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: controller.isRetrying.value
                                        ? null
                                        : controller.retryVirtualAccounts,
                                    icon: controller.isRetrying.value
                                        ? const SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                          )
                                        : const Icon(Icons.add_card_outlined, size: 18),
                                    label: Text(
                                      controller.isRetrying.value ? 'Generating...' : 'Generate Virtual Account',
                                      style: kEncodeSansMedium.copyWith(fontSize: 13),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff5f2e96),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          );
                        }
                        return SizedBox(
                          height: sizeVertical * 10,
                          width: double.infinity,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: accounts.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              final acct = accounts[index];
                              return Container(
                                padding: const EdgeInsets.all(8),
                                width: sizeHorizontal * 35,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.7, color: const Color(0xff332052)),
                                  color: Colors.black.withValues(alpha: 0.8),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      spacing: 3,
                                      children: [
                                        Text('Account No:', style: kEncodeSansSmall.copyWith(color: kWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5)),
                                        Text(acct.accountNumber ?? '', style: kEncodeSansMedium.copyWith(color: kWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5)),
                                        GestureDetector(
                                          onTap: () => _copyToClipboard(acct.accountNumber ?? '', 'Account Number'),
                                          child: const Icon(Icons.copy_rounded, size: 15, color: kWhite),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: sizeHorizontal * 3,
                                          height: sizeVertical * 3,
                                          child: Image.asset('assets/images/Mastercard.png'),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      spacing: 3,
                                      children: [
                                        Text('Bank:', style: kEncodeSansSmall.copyWith(color: kWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5)),
                                        Text(acct.bankName ?? '', style: kEncodeSansMedium.copyWith(color: kWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5)),
                                        const Spacer(),
                                        Text('JeroPay', style: kEncodeSansRegular.copyWith(color: kWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5)),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }),
                      SizedBox(height: sizeVertical * 1),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Recent Transactions',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1),

                      SizedBox(
                        height: sizeVertical * 45,
                        width: double.infinity,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              controller
                                  .dashboardModel
                                  .data!
                                  .transactions!
                                  .length,
                          scrollDirection: Axis.vertical,
                          separatorBuilder:
                              (context, index) => SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            Transactions trans =
                                controller
                                    .dashboardModel
                                    .data!
                                    .transactions![index];
                            return ReceiptCard(
                              sizeVertical: sizeVertical,
                              sizeHorizontal: sizeHorizontal,
                              details: trans.detail!,
                              networkImage:
                                  networkImage[trans.network!] ??
                                  'assets/images/logo-1.png',
                              networkName: trans.network!,
                              transactions: trans,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: sizeVertical * 2),
                    ],
                  ),
                ),
              ),
            );
      }),
    );
  }
}

extension on RouteDecoder {
  get widget => null;
}
