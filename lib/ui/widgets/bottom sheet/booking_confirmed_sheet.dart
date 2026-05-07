import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../../constants/assets.dart';
import '../../pages/review_detail_screen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class BookingConfirmedSheet extends StatefulWidget {
  const BookingConfirmedSheet({super.key});

  @override
  State<BookingConfirmedSheet> createState() => _BookingConfirmedSheetState();
}

class _BookingConfirmedSheetState extends State<BookingConfirmedSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // This pushes the sheet up when the keyboard appears
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 453.h,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF6E6FF), Color(0xFFFEE1D6)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(PngAssets.thumbsUp, height: 120.h, width: 160.w),
                SizedBox(height: 10.h),
                Text(
                  "Your booking is confirmed!",
                  style: AppFonts.black32w400,
                  textAlign: .center,
                ),
                SizedBox(height: 10.h),

                Text(
                  "We’ve reserved your slot successfully.",
                  style: AppFonts.black14w400,
                ),

                SizedBox(height: 33.h),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ReviewDetailScreen.routeName);
                  },
                  child: Container(
                    alignment: .center,
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
                    child: Text("Go to Home", style: AppFonts.black14w500),
                  ),
                ),
                SizedBox(height: MediaQuery.paddingOf(context).bottom + 20.h),
              ],
            ),
          ),
          // ── Floating ✕ button ──
          Positioned(
            top: -20.h,
            right: 8.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.dividerColor),
                ),
                alignment: Alignment.center,
                child: Icon(TablerIcons.playstationX, size: 20.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
