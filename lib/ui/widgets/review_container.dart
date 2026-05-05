import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.fillColor.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              CircleAvatar(
                radius: 20.sp,
                backgroundColor: AppColors.textGrey.withValues(alpha: 0.1),
                child: Text("OB", style: AppFonts.purple18w400),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Olivia Bennett", style: AppFonts.black16w500),
                  SizedBox(height: 4.h),
                  Text(
                    "Mon, sep 2, 2024 at 6:41 PM",
                    style: AppFonts.grey16w400,
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                TablerIcons.starFilled,
                size: 16.sp,
                color: AppColors.orange,
              ),
              SizedBox(width: 4.w),
              Text("5.0", style: AppFonts.black14w400),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            "Incredible! Terrell Haag provided the best therapy I've had ever. Also, the salon has a really pleasant atmosphere.",
            style: AppFonts.black16w400,
          ),
        ],
      ),
    );
  }
}
