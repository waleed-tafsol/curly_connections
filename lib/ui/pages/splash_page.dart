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
  late AnimationController _splashController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  late AnimationController _contentController;
  late Animation<double> _contentFadeAnimation;
  late Animation<Offset> _contentSlideAnimation;

  bool _showGetStarted = false;

  @override
  void initState() {
    super.initState();

    // Initial Splash Animation (Fade and Scale in)
    _splashController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 5.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _splashController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutQuart),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _splashController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
      ),
    );

    // Content Entrance Animation (Fade and Slide up)
    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _contentFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _contentController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );

    _contentSlideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _contentController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _splashController.forward();

    _splashController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              _showGetStarted = true;
            });
            _contentController.forward();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: AppColors.gradientScafoldBackground
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Animation (Moves naturally as column expands)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOutQuart,
                    width:  186.sp ,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Hero(
                          tag: 'app_logo',
                          child: Image.asset(
                            PngAssets.splashLogo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Animated Content Layer
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1500),
                    child: _showGetStarted ? _buildGetStartedContent() : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedContent() {
    return Column(
      key: const ValueKey('get_started_content'),
      children: [
        SizedBox(height: 8.h), // Consistent spacing after logo
        FadeTransition(
          opacity: _contentFadeAnimation,
          child: SlideTransition(
            position: _contentSlideAnimation,
            child: Column(
              children: [
                // Get Started Image
                Image.asset(
                  PngAssets.getStarted,
                  width: 305.sp,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 59.h),
                // Button
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
            ),
          ),
        ),
      ],
    );
  }
}
