import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class UpcomingAgenda extends StatelessWidget {
  final Status status;

  final bool showAsSaloon;
  final VoidCallback? onTap;
  const UpcomingAgenda({
    super.key,
    this.status = Status.pending,
    this.showAsSaloon = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.fillColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12.r),
          border: .all(color: AppColors.fillColor),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .start,
              children: [
                Icon(TablerIcons.hourglassEmpty, size: 16.sp),
                SizedBox(width: 10.w),
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: '17:30', style: AppFonts.black14w500),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(TablerIcons.arrowRight, size: 16.sp),
                SizedBox(width: 10.w),
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: '18:30', style: AppFonts.black14w500),
                    ],
                  ),
                ),
                if (status != Status.confirmed && !showAsSaloon) const Spacer(),
                if (status != Status.confirmed && !showAsSaloon)
                  Row(
                    children: [
                      Icon(
                        TablerIcons.history,
                        size: 16.sp,
                        color: AppColors.black,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Reschedule",
                        style: AppFonts.grey14w400.copyWith(
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              "Elena K.",
              style: AppFonts.black22w400.copyWith(height: 1.sp),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "FULL COLOR + TREATMENT",
                  style: AppFonts.grey14w400.copyWith(height: 1.sp),
                ),
                const Spacer(),
                if (!showAsSaloon)
                  Text(
                    status.label,
                    style: AppFonts.black14w400.copyWith(color: status.color),
                  ),
              ],
            ),
            if (showAsSaloon) ...{
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: .center,
                spacing: 6.w,
                children: [
                  Icon(
                    TablerIcons.mapPin,
                    size: 16.sp,
                    color: AppColors.orange,
                  ),
                  Text('Stockton', style: AppFonts.black14w500),
                ],
              ),
            },
          ],
        ),
      ),
    );
  }
}
