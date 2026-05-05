import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class BookingContainer extends StatelessWidget {
  const BookingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 89.h,
        decoration: BoxDecoration(
          color: AppColors.fillColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.fillColor,
            width: 1.5, // 👈 make sure this is visible
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 8.w,
                decoration: const BoxDecoration(color: AppColors.orange),
              ),
              SizedBox(width: 8.w),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0.w,
                  right: 16.w,
                  top: 16.w,
                  bottom: 7.h,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      mainAxisAlignment: .start,
                      children: [
                        Icon(TablerIcons.hourglassEmpty, size: 16.sp),
                        SizedBox(width: 10.w),
                        Text('15:30  ', style: AppFonts.black14w500),
                        SizedBox(width: 12.w),
                        Icon(TablerIcons.arrowRight, size: 16.sp),
                        SizedBox(width: 12.w),
                        Text('16:30  ', style: AppFonts.black14w500),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text("Crystal Rempel", style: AppFonts.grey12w400),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "FULL COLOR + TREATMENT",
                          style: AppFonts.black10w500,
                        ),
                        SizedBox(width: 8.w),
                        Text("∙", style: AppFonts.black20w400),
                        SizedBox(width: 8.w),
                        Icon(
                          TablerIcons.calendarDue,
                          size: 14.sp,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 4.w),
                        Text("Sep 2, Thurs", style: AppFonts.black10w500),
                        SizedBox(width: 8.w),
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
            ],
          ),
        ),
      ),
    );
  }
}
