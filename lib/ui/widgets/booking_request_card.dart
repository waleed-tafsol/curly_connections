import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../pages/review_detail_screen.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import 'bottom sheet/cancel_booking_sheet.dart';
import 'bottom sheet/rescheluling_request_sheet.dart';
import 'bottom sheet/stylist_rescheduling_request.dart';

class BookingRequestCard extends StatelessWidget {
  Status status = Status.booked;
  BookingRequestCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (status == Status.completed) {
          Navigator.pushNamed(context, ReviewDetailScreen.routeName);
        } else {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Colors.white.withValues(alpha: 0.9),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            builder: (_) => const StylistReschdulingRequestSheet(),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.fillColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.fillColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("April 24, Friday", style: AppFonts.grey16w400),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(TablerIcons.hourglassEmpty, size: 16.sp),
                SizedBox(width: 10.w),
                RichText(
                  textAlign: TextAlign.center,
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
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: '18:30', style: AppFonts.black14w500),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text("Elena K.", style: AppFonts.black22w400),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("FULL COLOR + TREATMENT", style: AppFonts.grey14w400),
                const Spacer(),
                Text(
                  status.label,
                  style: AppFonts.black14w400.copyWith(color: status.color),
                ),
              ],
            ),
            if (status != Status.completed) SizedBox(height: 28.h),
            if (status != Status.completed)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      iconAlignment: IconAlignment.end,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.white.withValues(alpha: 0.9),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          builder: (_) => const ReschelulingRequestSheet(),
                        );
                      },
                      label: Text("Reschedule", style: AppFonts.white14w500),
                      icon: Icon(
                        TablerIcons.calendar,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.white.withValues(alpha: 0.9),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          builder: (_) => const CancelBookingSheet(),
                        );
                      },
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Cancel Booking", style: AppFonts.black14w500),
                            SizedBox(width: 5.w),
                            Icon(
                              TablerIcons.playstationX,
                              size: 24.sp,
                              color: AppColors.black,
                            ),
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
