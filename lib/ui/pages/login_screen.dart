import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/text_form_field_with_title_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.purple, AppColors.peach],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 21.h),
              Image.asset(PngAssets.splashLogo, height: 64.h, width: 95.w),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: .start,
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
                mainAxisAlignment: .spaceBetween,
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
              Row(children: [Checkbox(value: true, onChanged: (_) {}),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
