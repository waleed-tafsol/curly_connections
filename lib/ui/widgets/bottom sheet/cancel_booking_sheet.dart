import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class CancelBookingSheet extends StatefulWidget {
  const CancelBookingSheet({super.key});

  @override
  State<CancelBookingSheet> createState() => _CancelBookingSheetState();
}

class _CancelBookingSheetState extends State<CancelBookingSheet> {
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
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            child: SingleChildScrollView(
              // Allows content to be pushed up
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cancel Booking", style: AppFonts.black20w400),
                  SizedBox(height: 24.h),

                  Text("Reason", style: AppFonts.black14w400),
                  SizedBox(height: 10.h),
                  const TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Tell us your reason",
                    ),
                  ),

                  SizedBox(height: 100.h),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                        mainAxisAlignment: .center,
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
                  SizedBox(height: 24.h),
                ],
              ),
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
                child: Icon(
                  TablerIcons.playstationX,
                  size: 20.sp,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
