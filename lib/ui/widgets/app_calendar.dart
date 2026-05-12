import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/date_time_utils.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class AppCalendar extends StatefulWidget {
  const AppCalendar({super.key});

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  DateTime _focusedDay = DateTime.now();
  final now = DateTime.now().subtract(const Duration(days: 1));

  List<String> getEvents(int day) {
    return switch (day) {
      2 => ['', '', ''],
      3 => ['', ''],
      6 => [''],
      8 => [''],
      10 => ['', '', ''],
      13 => ['', ''],
      15 => ['', ''],
      17 => [''],
      20 => ['', ''],
      22 => ['', '', ''],
      23 => [''],
      29 => ['', '', ''],
      31 => ['', '', ''],
      int() => [],
    };
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390.h,
      child: TableCalendar(
        shouldFillViewport: true,
        focusedDay: _focusedDay,
        firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronMargin: EdgeInsets.zero,
          rightChevronMargin: EdgeInsets.zero,
          rightChevronIcon: _buildIconContainer(TablerIcons.chevronRight),
          leftChevronIcon: _buildIconContainer(TablerIcons.chevronLeft),
        ),
        eventLoader: (dateTime) => getEvents(dateTime.day),
        enabledDayPredicate: (dateTime) => dateTime.isAfter(now),
        calendarBuilders: CalendarBuilders<String>(
          markerBuilder: (_, dateTime, events) {
            return Wrap(
              spacing: 2.w,
              runSpacing: 2.w,
              children: List.generate(events.length, (_) {
                return Container(
                  width: 5.w,
                  height: 5.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.orange, width: 1.26.w),
                  ),
                );
              }),
            );
          },
          headerTitleBuilder: (_, dateTime) {
            return Column(
              spacing: 5.h,
              children: [
                Text(dateTime.longMonth, style: AppFonts.black20w500),
                Text('${dateTime.year}', style: AppFonts.grey12w400),
              ],
            );
          },
          dowBuilder: (_, dateTime) {
            return Center(
              child: Text(dateTime.shortWeekDay, style: AppFonts.grey14w500),
            );
          },
          defaultBuilder: (_, dateTime, _) {
            return Center(
              child: Text('${dateTime.day}', style: AppFonts.black15w500),
            );
          },
          outsideBuilder: (_, dateTime, _) {
            return Center(
              child: Text('${dateTime.day}', style: AppFonts.grey15w500),
            );
          },
          todayBuilder: (_, dateTime, _) {
            return Center(
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.orange,
                ),
                child: Center(
                  child: Text('${dateTime.day}', style: AppFonts.white15w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container _buildIconContainer(IconData icon) {
    return Container(
      height: 36.w,
      width: 36.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(icon, size: 32.sp),
    );
  }
}
