import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class ServiceRequest extends StatelessWidget {
  const ServiceRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.fillColor.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12.r),
        border: .all(color: AppColors.fillColor),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text("April 24, Friday", style: AppFonts.grey16w400),
          SizedBox(height: 12.h),
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
                Status.pending.label,
                style: AppFonts.black14w400.copyWith(
                  color: Status.pending.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 28.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {},
                  label: Text("Approve Request", style: AppFonts.white14w500),
                  icon: Icon(
                    TablerIcons.circleCheck,
                    color: AppColors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              SizedBox(width: 16.w),

              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text("Reject Request", style: AppFonts.black14w500),
                        SizedBox(width: 5.w),
                        Icon(TablerIcons.thumbDown, size: 24.sp),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
