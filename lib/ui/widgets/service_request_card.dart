import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import 'bottom sheet/stylist_booking_request_sheet.dart';
import 'bottom sheet/stylist_rescheduling_request.dart';

class ServiceRequestCard extends StatelessWidget {
  int? index;
  ServiceRequestCard({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.white.withValues(alpha: 0.9),
          builder: (_) => index != 1
              ? StylistBookingRequestSheet(
                  showButton: index == 2 ? false : true,
                )
              : const StylistReschdulingRequestSheet(),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.fillColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12.r),
          border: .all(color: AppColors.fillColor, width: 2.w),
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
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              "Elena K.",
              style: AppFonts.black22w400.copyWith(height: 1.sp),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  "FULL COLOR + TREATMENT",
                  style: AppFonts.grey14w400.copyWith(height: 1.sp),
                ),
                const Spacer(),
                Text(
                  index == 2 ? Status.canceled.label : Status.pending.label,
                  style: AppFonts.black14w400.copyWith(
                    color: index == 2
                        ? Status.canceled.color
                        : Status.pending.color,
                  ),
                ),
              ],
            ),
            if (index != 2) SizedBox(height: 28.h),
            if (index != 2)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.5),
                            blurRadius: 10.r,
                          ),
                        ],
                        color: AppColors.brown,
                        borderRadius: BorderRadius.circular(12.r),
                        border: .all(color: AppColors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Text("Approve", style: AppFonts.white14w500),
                          SizedBox(width: 4.w),
                          Icon(
                            TablerIcons.circleCheck,
                            color: AppColors.white,
                            size: 24.sp,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Expanded(
                  //   child: ElevatedButton.icon(
                  //     iconAlignment: IconAlignment.end,
                  //     style: ElevatedButton.styleFrom(
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 8.w,
                  //         vertical: 8.h,
                  //       ),
                  //     ),
                  //     onPressed: () {},
                  //     label: Text(
                  //       "Approve Request",
                  //       style: AppFonts.white14w500,
                  //     ),
                  //     icon: Icon(
                  //       TablerIcons.circleCheck,
                  //       color: AppColors.white,
                  //       size: 23.sp,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(width: 16.w),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
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
                            Text("Reject", style: AppFonts.black14w500),
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
      ),
    );
  }
}
