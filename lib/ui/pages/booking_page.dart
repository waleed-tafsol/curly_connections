import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/date_time_utils.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_divider.dart';
import '../widgets/bottom sheet/booking_confirmed_sheet.dart';

class BookingPage extends StatelessWidget {
  static const String routeName = '/booking_page';
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(TablerIcons.chevronLeft),
        ),
        title: Text('Back', style: AppFonts.black14w500),
        titleSpacing: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 30.h),
              Text('Sarah Mendoza', style: AppFonts.black28w300),
              SizedBox(height: 10.h),
              Text('FULL COLOR + TREATMENT', style: AppFonts.grey14w400),
              SizedBox(height: 14.h),
              Row(
                spacing: 6.w,
                children: [
                  Icon(
                    TablerIcons.mapPin,
                    size: 18.sp,
                    color: AppColors.orange,
                  ),
                  Text('East Side • 1.5 km away', style: AppFonts.black14w400),
                ],
              ),
              AppDivider(margin: EdgeInsets.symmetric(vertical: 22.h)),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('Select Date', style: AppFonts.black22w300),
                  Icon(
                    TablerIcons.calendarDue,
                    size: 24.sp,
                    color: AppColors.darkPurple,
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              _buildWeekCalendar(),
              SizedBox(height: 22.h),
              Text('Schedule Slots', style: AppFonts.black14w500),
              SizedBox(height: 12.h),
              _buildSlots(),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.white.withValues(alpha: 0.5),
                    builder: (_) => const BookingConfirmedSheet(),
                  );
                },
                label: const Text('Confirm Booking'),
                icon: const Icon(TablerIcons.arrowRight),
                iconAlignment: IconAlignment.end,
              ),
              SizedBox(height: MediaQuery.paddingOf(context).bottom + 30.h),
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
                border: Border.all(color: AppColors.lightGreen),
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

  Container _buildWeekCalendar() {
    final now = DateTime.now();
    final start = now.subtract(Duration(days: now.weekday));
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 12.h,
        children: [
          Text(now.monthYear, style: AppFonts.black22w400),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: List.generate(7, (index) {
              final date = start.add(Duration(days: index));
              return Container(
                decoration: now.isAtSameMomentAs(date)
                    ? BoxDecoration(
                        color: AppColors.lightOrange1,
                        border: Border.all(color: AppColors.orange),
                        borderRadius: BorderRadius.circular(6.r),
                      )
                    : null,
                padding: EdgeInsets.all(6.w),
                child: Column(
                  spacing: 12.h,
                  children: [
                    Text(date.shortWeekDay, style: AppFonts.grey12w400),
                    Text('${date.day}'),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
