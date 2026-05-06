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
  late Animation<double> _logoAnimation;
  bool _showGetStarted = false;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOutBack,
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
            // Logo that animates position and scale
            AnimatedAlign(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOutQuart,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: "logo",
                    child: ScaleTransition(
                      scale: _logoAnimation,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOutQuart,
                        width: _showGetStarted ? 186.sp : 291.w,
                        child: Image.asset(
                          PngAssets.splashLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.bounceIn,
                    child: _showGetStarted
                        ? Column(
                            children: [
                              SizedBox(height: 8.h),
                              Image.asset(
                                PngAssets.getStarted,
                                width: 305.sp,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 59.h),
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
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
