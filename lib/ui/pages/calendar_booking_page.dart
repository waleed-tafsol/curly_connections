import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_calendar.dart';
import '../widgets/booking_container.dart';

class CalendarBookingPage extends StatelessWidget {
  static const String routeName = '/calendar_booking_page';
  const CalendarBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ListTile(
            title: Text('Calendar', style: AppFonts.black20w500),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(TablerIcons.bell, size: 32.sp, color: AppColors.black),
            ),
          ),
          const AppCalendar(),
          Center(
            child: Container(
              width: 30.w,
              height: 5.h,
              margin: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(99.r),
              ),
            ),
          ),
          Text('Bookings', style: AppFonts.black20w500),
          SizedBox(height: 20.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom,
              ),
              child: Column(
                spacing: 17.5.h,
                children: List.generate(10, (_) => const BookingContainer()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
