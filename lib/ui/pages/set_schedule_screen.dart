// ── 1. set_schedule_screen.dart ──

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/bottom sheet/add_schedule_sheet.dart';
import '../widgets/custom_appbar_back_button.dart';

class SetScheduleScreen extends StatefulWidget {
  static const String routeName = '/set_schedule';
  const SetScheduleScreen({super.key});

  @override
  State<SetScheduleScreen> createState() => _SetScheduleScreenState();
}

class _SetScheduleScreenState extends State<SetScheduleScreen> {
  final List<String> _scheduleItems = ['Hair Coloring', 'Haircuts & Styling'];

  void _openAddSchedule() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white.withValues(alpha: 0.5),
      builder: (_) => const AddScheduleBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBarBackButton(),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 117.5.h),
              Text('Set your schedule', style: AppFonts.black20w400),
              SizedBox(height: 4.h),
              Text('You can update it later', style: AppFonts.grey12w400),
              SizedBox(height: 20.h),
              Text('Schedule List', style: AppFonts.black14w400),
              SizedBox(height: 12.h),
              ..._scheduleItems.map(
                (item) => GestureDetector(
                  onTap: _openAddSchedule,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item, style: AppFonts.black14w400),
                        Icon(Icons.chevron_right, size: 18.sp),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
