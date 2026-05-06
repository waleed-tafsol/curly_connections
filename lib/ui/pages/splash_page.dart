import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import 'select_role_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  bool _showGetStarted = false;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _logoController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showGetStarted = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: AppColors.gradientScafoldBackground
        ),
        child: Stack(
          children: [
            // Single Hero that handles the transition of the "Main Visual"
            AnimatedAlign(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOutQuart,
              alignment: _showGetStarted ? const Alignment(0, -0.2) : Alignment.center,
              child: Hero(
                tag: "logo",
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    final isSplash = child.key == const ValueKey('splash');
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: isSplash 
                          ? animation // Small to Big for splash
                          : Tween<double>(begin: 1.5, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)), // Big to Small for second
                        child: child,
                      ),
                    );
                  },
                  child: _showGetStarted
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              PngAssets.getStarted,
                              key: const ValueKey('get_started'),
                              height: 190.h,
                              fit: BoxFit.contain,
                            ),
                          SizedBox(height:59.w),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 46.0.w),
                            child: ElevatedButton.icon(
                              iconAlignment: IconAlignment.end,
                              onPressed: () {
                                Navigator.pushNamed(context, SelectRoleScreen.routeName);
                              },
                              label: const Text("Get Started"),
                              icon: Icon(TablerIcons.arrowRight, size: 13.sp),
                            ),
                          )
                        ],
                      )
                      : Image.asset(
                          PngAssets.splashLogo,
                          key: const ValueKey('splash'),
                          height: 196.h,
                          width: 291.w,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

