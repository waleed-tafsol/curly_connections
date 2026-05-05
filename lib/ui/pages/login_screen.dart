import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/text_form_field_with_title_widget.dart';
import 'bottom_nav_page.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _rememberMe.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: const BoxDecoration(
            gradient: AppColors.gradientScafoldBackground,
          ),
          child: Column(
            children: [
              SizedBox(height: 21.h),
              Image.asset(PngAssets.splashLogo, height: 64.h, width: 95.w),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back", style: AppFonts.black22w400),
                      SizedBox(height: 3.h),
                      Text(
                        "Sign in to your Curly account",
                        style: AppFonts.grey14w400,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      TablerIcons.questionMark,
                      size: 18.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              TextFormFieldWithTitleWidget(
                title: 'Email',
                controller: TextEditingController(),
                hintText: "your.email@example.com",
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password",
                    style: AppFonts.black14w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    child: Text(
                      "Forgot password?",
                      style: AppFonts.grey14w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "••••••••",
                  suffixIcon: Icon(TablerIcons.eye, size: 22.sp),
                ),
              ),
              SizedBox(height: 15.h),

              // 👇 ValueListenableBuilder wrapping the checkbox row
              ValueListenableBuilder<bool>(
                valueListenable: _rememberMe,
                builder: (context, value, _) {
                  return Row(
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (newValue) {
                          _rememberMe.value = newValue ?? false;
                        },
                      ),
                      Text("Remember me", style: AppFonts.black13w400),
                    ],
                  );
                },
              ),

              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      BottomNavPage.routeName,
                      (route) => false,
                    );
                  },
                  label: const Text("Sign In"),
                  icon: Icon(TablerIcons.arrowRight, size: 13.sp),
                ),
              ),
              SizedBox(height: 18.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CreateAccountScreen.routeName);
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: AppFonts.black14w400,
                      ),
                      TextSpan(text: 'Sign Up', style: AppFonts.black14w500),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
