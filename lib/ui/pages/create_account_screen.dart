import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/text_form_field_with_title_widget.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = '/create_account';
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
            crossAxisAlignment: .start,
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
                title: 'Full Name',
                controller: TextEditingController(),
                hintText: "e.g Kate Haley",
              ),
              TextFormFieldWithTitleWidget(
                title: 'Location',
                controller: TextEditingController(),
                hintText: "e.g Kate Haley",
                suffixIcon: TablerIcons.mapPin,
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
              Text(
                "Confirm Password",
                style: AppFonts.black14w400,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 7.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "••••••••",
                  suffixIcon: Icon(TablerIcons.eye, size: 22.sp),
                ),
              ),

              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                  label: const Text("Create Account"),
                  icon: Icon(TablerIcons.arrowRight, size: 13.sp),
                ),
              ),
              SizedBox(height: 18.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: AppFonts.black14w400,
                        ),
                        TextSpan(text: 'Sign In', style: AppFonts.black14w500),
                      ],
                    ),
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
