// ── 4. guidance_note_bottom_sheet.dart ──

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../../constants/assets.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class StylistReschdulingRequestSheet extends StatefulWidget {
  const StylistReschdulingRequestSheet({super.key});

  @override
  State<StylistReschdulingRequestSheet> createState() =>
      _StylistReschdulingRequestSheetState();
}

class _StylistReschdulingRequestSheetState
    extends State<StylistReschdulingRequestSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Text("Rescheduling request", style: AppFonts.grey20w400),
              SizedBox(height: 24.h),
              Divider(height: 0.h, color: AppColors.dividerColor),
              SizedBox(height: 16.h),
              Text("Previous Slot", style: AppFonts.black14w500),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(TablerIcons.hourglassEmpty, size: 16.sp),
                  SizedBox(width: 10.w),
                  Text('17:30', style: AppFonts.black14w500),
                  SizedBox(width: 12.w),
                  Icon(TablerIcons.arrowRight, size: 16.sp),
                  SizedBox(width: 12.w),
                  Text('18:30', style: AppFonts.black14w500),
                  const Spacer(),
                  Text("April 24, Friday", style: AppFonts.grey16w400),
                ],
              ),
              SizedBox(height: 16.h),
              Divider(height: 0.h, color: AppColors.dividerColor),
              SizedBox(height: 12.h),
              Text("Elena K.", style: AppFonts.black22w400),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text("FULL COLOR + TREATMENT", style: AppFonts.grey14w400),
                  const Spacer(),
                  SvgPicture.asset(
                    SvgAssets.reschedule,
                    height: 16.h,
                    width: 16.w,
                  ),
                  SizedBox(width: 4.w),
                  Text("Reschedule", style: AppFonts.grey14w400),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(height: 0.h, color: AppColors.dividerColor),
              SizedBox(height: 16.h),
              Text("Requested Slot", style: AppFonts.black14w500),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(TablerIcons.hourglassEmpty, size: 16.sp),
                  SizedBox(width: 10.w),
                  Text('17:30', style: AppFonts.black14w500),
                  SizedBox(width: 12.w),
                  Icon(TablerIcons.arrowRight, size: 16.sp),
                  SizedBox(width: 12.w),
                  Text('18:30', style: AppFonts.black14w500),
                  const Spacer(),
                  Text("April 29, Tue", style: AppFonts.grey16w400),
                ],
              ),

              SizedBox(height: 24.h),

              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          TablerIcons.history,
                          size: 24.sp,
                          color: AppColors.white,
                        ),
                        label: const Text('Reschedule'),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                              Text(
                                'Cancel Booking',
                                style: AppFonts.black14w400,
                              ),
                              SizedBox(width: 4.w),
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
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),

        // ── Floating ✕ button ──
        Positioned(
          top: -20.h, // ← sits above the sheet
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
    );
  }
}
