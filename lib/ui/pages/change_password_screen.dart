import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = '/change_password_screen';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Change Password',
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        alignment: Alignment.center,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: 34.h),
                  Text("Change Password", style: AppFonts.black22w400),

                  SizedBox(height: 24.h),

                  Text(
                    "Old Password",
                    style: AppFonts.black14w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 7.h),
                  TextFormField(
                    style: AppFonts.black16w400,
                    decoration: InputDecoration(
                      hintText: "••••••••",
                      suffixIcon: Icon(TablerIcons.eye, size: 22.sp),
                    ),
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
                          "create a strong password",
                          style: AppFonts.grey14w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  TextFormField(
                    style: AppFonts.black16w400,

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
                    style: AppFonts.black16w400,
                    decoration: InputDecoration(
                      hintText: "••••••••",
                      suffixIcon: Icon(TablerIcons.eye, size: 22.sp),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    iconAlignment: IconAlignment.end,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                    label: const Text("Change Password"),
                    icon: Icon(TablerIcons.arrowRight, size: 16.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
      );


  }
}
