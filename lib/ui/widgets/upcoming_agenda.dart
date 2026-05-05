import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class UpcomingAgenda extends StatelessWidget {
  final bool isReschedulable;
  const UpcomingAgenda({super.key, this.isReschedulable = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                      TextSpan(text: '5:30  ', style: AppFonts.black14w500),
                      TextSpan(text: 'PM', style: AppFonts.grey14w500),
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
                      TextSpan(text: '6:30  ', style: AppFonts.black14w500),
                      TextSpan(text: 'PM', style: AppFonts.grey14w500),
                    ],
                  ),
                ),
                if (isReschedulable) const Spacer(),
                if (isReschedulable)
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
            Text("Elena K.", style: AppFonts.black22w400),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text("FULL COLOR + TREATMENT", style: AppFonts.grey14w400),
                const Spacer(),
                Text(
                  Status.confirmed.label,
                  style: AppFonts.black14w400.copyWith(
                    color: Status.confirmed.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
