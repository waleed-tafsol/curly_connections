// ── 4. guidance_note_bottom_sheet.dart ──

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../../constants/assets.dart';
import '../../../utils/enums.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class StylistBookingRequestSheet extends StatefulWidget {
  final bool showButton;

  const StylistBookingRequestSheet({super.key, this.showButton = true});

  @override
  State<StylistBookingRequestSheet> createState() =>
      _StylistBookingRequestSheetState();
}

class _StylistBookingRequestSheetState
    extends State<StylistBookingRequestSheet> {
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
            mainAxisSize: MainAxisSize.min, // ← size to content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // ← space for ✕ button
              Text("Booking request", style: AppFonts.grey20w500),
              SizedBox(height: 24.h),
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
              SizedBox(height: 16.h),
              Divider(height: 0.h, color: AppColors.dividerColor),
              SizedBox(height: 16.h),
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      DummyAssets.profile,
                      height: 50.h,
                      width: 50.w,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Elena K.", style: AppFonts.black22w400),
                      Chip(
                        backgroundColor: AppColors.peach,
                        side: const BorderSide(color: AppColors.orange),
                        label: Text("Free Plan", style: AppFonts.black10w500),
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text("FULL COLOR + TREATMENT", style: AppFonts.grey14w400),
              SizedBox(height: 9.h),
              Row(
                children: [
                  Icon(
                    TablerIcons.mapPin,
                    size: 16.sp,
                    color: AppColors.orange,
                  ),
                  SizedBox(width: 2.w),
                  Text("Stockton", style: AppFonts.black14w500),
                  const Spacer(),
                  Text(
                    widget.showButton
                        ? Status.pending.label
                        : Status.confirmed.label,
                    style: AppFonts.black14w400.copyWith(
                      color: widget.showButton
                          ? Status.pending.color
                          : Status.confirmed.color,
                    ),
                  ),
                ],
              ),
              if (widget.showButton) SizedBox(height: 24.h),
              if (widget.showButton)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          iconAlignment: IconAlignment.end,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            TablerIcons.circleCheck,
                            size: 24.sp,
                            color: AppColors.white,
                          ),
                          label: const Text('Approve Request'),
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
                                  'Reject Request',
                                  style: AppFonts.black14w400,
                                ),
                                SizedBox(width: 4.w),
                                Icon(
                                  TablerIcons.thumbDown,
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
              SizedBox(height: MediaQuery.paddingOf(context).bottom + 24.h),
            ],
          ),
        ),
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
    );
  }
}
