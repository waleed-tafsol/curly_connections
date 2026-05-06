import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';
import '../../utils/enums.dart';
import '../view_models/auth_view_model.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String desc;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  @override
  void initState() {
    _Pages = context.read<AuthViewModel>().userType == UserType.stylist
        ? [
            OnBoardingModel(
              image: PngAssets.onboardingSty1,
              title: "Grow Your Beauty Business",
              desc:
                  "Join a platform where clients discover your talent. Build your presence and reach more customers effortlessly.",
            ),
            OnBoardingModel(
              image: PngAssets.onboardingSty2,
              title: "Manage Bookings with Ease",
              desc:
                  "Accept appointments, set your availability, and stay organized. Everything you need, all in one place.",
            ),
            OnBoardingModel(
              image: PngAssets.onboardingSty3,
              title: "Showcase Your Skills",
              desc:
                  "Create your profile, add services, and highlight your expertise. Let your work speak for itself.",
            ),
          ]
        : [
            OnBoardingModel(
              image: PngAssets.onboardingClt1,
              title: "Grow Your Beauty Business",
              desc:
                  "Join a platform where clients discover your talent. Build your presence and reach more customers effortlessly.",
            ),
            OnBoardingModel(
              image: PngAssets.onboardingClt1,
              title: "Find the best services",
              desc: "Explore top professionals بسهولة",
            ),
            OnBoardingModel(
              image: PngAssets.onboardingClt3,
              title: "Book instantly",
              desc: "Fast and easy booking experience",
            ),
          ];
    super.initState();
  }

  late List<OnBoardingModel> _Pages;

  void _nextPage() {
    if (_currentIndex < _Pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {}
  }

  void _skip() {
    _controller.jumpToPage(_Pages.length - 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PngAssets.selectrole),
              fit: BoxFit.fill,
              //   fit: BoxFit.contain,
            ),
          ),
          child: Column(
            children: [
              /// PageView
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _Pages.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final page = _Pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            page.image,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              page.title,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              page.desc,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),

              /// Dots indicator
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _Pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(4),
                      width: _currentIndex == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Colors.black
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

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
                          _currentIndex == _Pages.length - 1
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
        ),
      ),
    );
  }
}
