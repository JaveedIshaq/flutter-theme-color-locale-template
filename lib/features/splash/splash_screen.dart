import 'package:flutter/material.dart';
import 'package:myapp/exports/common_widgets_export.dart';
import 'package:myapp/features/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //
  late AnimationController animationController;

  /// init Screen bool
  /// check if it is first time App is launched by user
  int? freshInstall;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animationController.forward();
    checkIfFirstLoad();
    super.initState();
    _navigateAwayAfterDelay();
  }

  Future<void> _navigateAwayAfterDelay() async {
    Future.delayed(const Duration(seconds: 2)).then(
      (_) {
        if (freshInstall == 0 || freshInstall == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
            (route) => false,
          );
        } else {
          // Make it navigate to other Screen
          // If it is not Fresh Install
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
            (route) => false,
          );
        }
      },
    );
  }

  checkIfFirstLoad() async {
    /// Setting an Int value for freshInstall
    /// To show the OnBoarding Screens at Start
    final prefs = await SharedPreferences.getInstance();
    freshInstall = prefs.getInt('freshInstall');
    await prefs.setInt('freshInstall', 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomTopMoveAnimationView(
          animationController: animationController,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Center(
              child: CustomImageView(
                imagePath: "assets/images/splash_logo.png",
              ),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: Stack(
    //     children: <Widget>[
    //       Container(
    //         foregroundDecoration: !Get.find<ThemeController>().isLightMode
    //             ? BoxDecoration(
    //                 color: Theme.of(context)
    //                     .colorScheme
    //                     .background
    //                     .withOpacity(0.4))
    //             : null,
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height,
    //         child: Image.asset(Localfiles.introduction, fit: BoxFit.cover),
    //       ),
    //       Column(
    //         children: <Widget>[
    //           const Expanded(
    //             flex: 1,
    //             child: SizedBox(),
    //           ),
    //           Center(
    //             child: Container(
    //               width: 60,
    //               height: 60,
    //               decoration: BoxDecoration(
    //                 borderRadius: const BorderRadius.all(
    //                   Radius.circular(8.0),
    //                 ),
    //                 boxShadow: <BoxShadow>[
    //                   BoxShadow(
    //                       color: Theme.of(context).dividerColor,
    //                       offset: const Offset(1.1, 1.1),
    //                       blurRadius: 10.0),
    //                 ],
    //               ),
    //               child: ClipRRect(
    //                 borderRadius: const BorderRadius.all(
    //                   Radius.circular(8.0),
    //                 ),
    //                 child: Image.asset(Localfiles.appIcon),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 16,
    //           ),
    //           Text(
    //             "Motel",
    //             textAlign: TextAlign.left,
    //             style: TextStyles(context).getBoldStyle().copyWith(
    //                   fontSize: 24,
    //                 ),
    //           ),
    //           const SizedBox(
    //             height: 8,
    //           ),
    //           AnimatedOpacity(
    //             opacity: isLoadText ? 1.0 : 0.0,
    //             duration: const Duration(milliseconds: 420),
    //             child: Text(
    //               Loc.alized.best_hotel_deals,
    //               textAlign: TextAlign.left,
    //               style: TextStyles(context).getRegularStyle().copyWith(),
    //             ),
    //           ),
    //           const Expanded(
    //             flex: 4,
    //             child: SizedBox(),
    //           ),
    //           AnimatedOpacity(
    //             opacity: isLoadText ? 1.0 : 0.0,
    //             duration: const Duration(milliseconds: 680),
    //             child: CommonButton(
    //               padding: const EdgeInsets.only(
    //                   left: 48, right: 48, bottom: 8, top: 8),
    //               buttonText: Loc.alized.get_started,
    //               onTap: () {
    //                 NavigationServices(context).gotoIntroductionScreen();
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
