import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import 'select_role_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static const String routeName = "/get_started";
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.purple, AppColors.peach],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 46.w),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(PngAssets.getStarted, height: 190.h),
            SizedBox(height: 60.h),
            ElevatedButton.icon(
              iconAlignment: .end,
              onPressed: () {
                Navigator.pushNamed(context, SelectRoleScreen.routeName);
              },
              label: const Text("Get Started"),
              icon: Icon(TablerIcons.arrowRight, size: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
