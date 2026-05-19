import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../../models/ui/onboarding_data.dart';
import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/auth_view_model.dart';
import 'login_screen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "/onboarding";

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  static const _stylistPages = [
    OnBoardingData(
      image: PngAssets.onboardingSty1,
      title: "Grow Your Beauty Business",
      desc:
          "Join a platform where clients discover your talent. Build your presence and reach more customers effortlessly.",
    ),
    OnBoardingData(
      image: PngAssets.onboardingSty2,
      title: "Manage Bookings with Ease",
      desc:
          "Accept appointments, set your availability, and stay organized. Everything you need, all in one place.",
    ),
    OnBoardingData(
      image: PngAssets.onboardingSty3,
      title: "Showcase Your Skills",
      desc:
          "Create your profile, add services, and highlight your expertise. Let your work speak for itself.",
    ),
  ];
  static const _clientPages = [
    OnBoardingData(
      image: PngAssets.onboardingClt1,
      title: "Discover Top Hair Stylists",
      desc:
          'Find trusted professionals near you with ease. Browse profiles, compare services, and choose what suits you best.',
    ),
    OnBoardingData(
      image: PngAssets.onboardingClt2,
      title: "Effortless Beauty Booking",
      desc:
          "Search, select, and book in seconds. Managing your appointments has never been easier.",
    ),
    OnBoardingData(
      image: PngAssets.onboardingClt3,
      title: "Your Style, Your Choice",
      desc:
          "Explore a wide range of services tailored to your needs. Pick the right stylist for your perfect look.",
    ),
  ];

  List<OnBoardingData> get _pages {
    final userType = ref.read(authProvider);
    return switch (userType) {
      UserType.stylist => _stylistPages,
      UserType.client => _clientPages,
    };
  }

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.routeName,
        (route) => false,
      );
    }
  }

  void _skip() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var page = _pages[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: Container(
                key: ValueKey<int>(_currentIndex),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(page.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              /// PageView
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final item = _pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 104.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.title,
                              textAlign: TextAlign.left,
                              style: AppFonts.black32w400.copyWith(height: 1.2),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 104.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.desc,
                              textAlign: TextAlign.left,
                              style: AppFonts.black14w400.copyWith(height: 1.4),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),

              /// Dots indicator
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(4),
                      width: 57.sp,
                      height: _currentIndex == index ? 3.sp : 2.sp,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? AppColors.white
                            : AppColors.white.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              /// Next / Get Started button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          // minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: _skip,
                        child: const Text("Skip"),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          // minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Text(
                          _currentIndex == _pages.length - 1
                              ? "Get Started"
                              : "Next",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
