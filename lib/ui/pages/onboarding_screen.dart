import 'package:flutter/material.dart';

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
  const OnboardingScreen({super.key, required this.isStylist});
  static const String routeName = "/onboarding";
  final bool isStylist;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  @override
  void initState() {
    _Pages = widget.isStylist
        ? [
            OnBoardingModel(
              image: "assets/images/onboarding1.png",
              title: "Grow Your Beauty Business",
              desc:
                  "Join a platform where clients discover your talent. Build your presence and reach more customers effortlessly.",
            ),
            OnBoardingModel(
              image: "assets/images/onboarding2.png",
              title: "Find the best services",
              desc: "Explore top professionals بسهولة",
            ),
            OnBoardingModel(
              image: "assets/images/onboarding3.png",
              title: "Book instantly",
              desc: "Fast and easy booking experience",
            ),
          ]
        : [
            OnBoardingModel(
              image: "assets/images/onboarding1.png",
              title: "Grow Your Beauty Business",
              desc:
                  "Join a platform where clients discover your talent. Build your presence and reach more customers effortlessly.",
            ),
            OnBoardingModel(
              image: "assets/images/onboarding2.png",
              title: "Find the best services",
              desc: "Explore top professionals بسهولة",
            ),
            OnBoardingModel(
              image: "assets/images/onboarding3.png",
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
    } else {
      // TODO: Navigate to next screen
    }
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
        child: Column(
          children: [
            /// Skip button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: _skip, child: const Text("Skip")),
            ),

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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(page.image, height: 250),
                        const SizedBox(height: 30),
                        Text(
                          page.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          page.desc,
                          style: const TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _Pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  width: _currentIndex == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Next / Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  _currentIndex == _Pages.length - 1 ? "Get Started" : "Next",
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
