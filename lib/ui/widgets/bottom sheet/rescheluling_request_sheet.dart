import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../../utils/date_time_utils.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class ReschelulingRequestSheet extends StatefulWidget {
  const ReschelulingRequestSheet({super.key});

  @override
  State<ReschelulingRequestSheet> createState() =>
      _ReschelulingRequestSheetState();
}

class _ReschelulingRequestSheetState extends State<ReschelulingRequestSheet> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: double.infinity),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
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
                      Text("Rescheduling request", style: AppFonts.black20w400),
                      SizedBox(height: 12.h),
                      Divider(height: 0.h, color: AppColors.dividerColor),
                      SizedBox(height: 16.h),
                      Text("Select Date", style: AppFonts.black14w500),
                      SizedBox(height: 15.h),
                      Text("April 29, Friday", style: AppFonts.black16w400),
                      SizedBox(height: 15.h),
                      Divider(height: 0.h, color: AppColors.dividerColor),
                      SizedBox(height: 12.h),
                      Text("Schedule Slots", style: AppFonts.black14w500),
                      SizedBox(height: 12.h),
                      _buildSlots(),
                      SizedBox(height: 40.h),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Expanded(child: SizedBox()),
                            Expanded(
                              flex: 4,
                              child: ElevatedButton.icon(
                                iconAlignment: IconAlignment.end,
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  TablerIcons.history,
                                  size: 24.sp,
                                  color: AppColors.white,
                                ),
                                label: const Text('Request Reschedule'),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            GestureDetector(
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
                                    Text('Cancel', style: AppFonts.black14w400),
                                  ],
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
        ),
      ),
    );
  }

  Wrap _buildSlots() {
    final time = DateTime(0, 0, 0, 8, 30);
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: List.generate(5, (index) {
        final start = time.add(Duration(hours: index));
        final end = start.add(const Duration(hours: 1));
        return Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12.r),
            child: Ink(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.lightPeach),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Text(
                '${start.time24Hours} - ${end.time24Hours}',
                style: AppFonts.black16w600,
              ),
            ),
          ),
        );
      }),
    );
  }
}
