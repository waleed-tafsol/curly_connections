import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class BookingSummary extends StatelessWidget {
  const BookingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 16.w),
        decoration: BoxDecoration(
          gradient: AppColors.gradientPeachToPurple,
          borderRadius: BorderRadius.circular(12.r),
          border: .all(color: AppColors.fillColor, width: 2.w),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .start,
              children: [
                Text(
                  "BOOKING SUMMARY",
                  style: AppFonts.grey10w400.copyWith(letterSpacing: 2.w),
                ),
                const Spacer(),
                Text("VIEW ALL", style: AppFonts.black10w500),
                SizedBox(width: 5.w),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: 12.sp,
                  color: AppColors.black,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,

                    children: [
                      Text("28", style: AppFonts.black28w400),
                      SizedBox(height: 4.h),
                      Text("Upcoming Bookings", style: AppFonts.grey12w400),
                    ],
                  ),
                ),

                SizedBox(width: 12.w),
                Container(height: 51.h, width: 1.w, color: AppColors.fillColor),
                SizedBox(width: 12.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      crossAxisAlignment: .start,

                      children: [
                        Text("42", style: AppFonts.black28w400),
                        SizedBox(height: 4.h),
                        Text("Total Bookings", style: AppFonts.grey12w400),
                      ],
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
