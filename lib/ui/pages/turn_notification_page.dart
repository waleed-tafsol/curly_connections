import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar_back_button.dart';

class TurnNotificationPage extends StatelessWidget {
  const TurnNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBackButton(
        onNext: () {
          // Navigator.pushReplacementNamed(
          //   context,
          //   SelectCategoriesScreen.routeName,
          // );
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Text("Turn on notifications", style: AppFonts.black20w400),
            SizedBox(height: 5.h),
            Text(
              "Don’t miss important messages like check-in details and account activity",
              style: AppFonts.black12w400,
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: .all(color: AppColors.white),
              ),
              child: Row(
                children: [
                  Text(
                    "Allow notifications to stay informed about your bookings and favorite stylists.",
                    style: AppFonts.black12w400,
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
