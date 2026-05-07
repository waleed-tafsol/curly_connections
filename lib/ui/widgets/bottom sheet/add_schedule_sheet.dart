// ── 2. add_schedule_bottom_sheet.dart ──

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import 'guidance_sheet.dart';
import 'set_time_sheet.dart';

class AddScheduleBottomSheet extends StatefulWidget {
  const AddScheduleBottomSheet({super.key});

  @override
  State<AddScheduleBottomSheet> createState() => _AddScheduleBottomSheetState();
}

class _AddScheduleBottomSheetState extends State<AddScheduleBottomSheet> {
  final List<String> _days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  int _selectedDayIndex = 2; // Tuesday
  TimeOfDay _startTime = const TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _endTime = const TimeOfDay(hour: 18, minute: 30);

  String _formatTime(TimeOfDay t) {
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final minute = t.minute.toString().padLeft(2, '0');
    //final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute';
  }

  String _dayName(int index) {
    const names = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    return names[index];
  }

  void _openSetTime() async {
    final result = await showModalBottomSheet<Map<String, TimeOfDay>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white.withValues(alpha: 0.5),
      builder: (_) =>
          SetTimeBottomSheet(initialStart: _startTime, initialEnd: _endTime),
    );
    if (result != null) {
      setState(() {
        _startTime = result['start']!;
        _endTime = result['end']!;
      });
    }
  }

  void _openGuidanceNote() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white.withValues(alpha: 0.5),
      builder: (_) => const GuidanceNoteBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.white, // ← solid white
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // ← wrap content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text('Add Schedule', style: AppFonts.grey19w500),
                SizedBox(height: 24.h),

                // Service Category
                Text('Service Category', style: AppFonts.grey14w400),
                SizedBox(height: 16.h),
                Text('Hair Coloring', style: AppFonts.black16w400),
                SizedBox(height: 12.h),
                Divider(
                  height: 0.h,
                  color: AppColors.textGrey.withValues(alpha: 0.2),
                ),
                SizedBox(height: 16.h),

                // Day Selector
                Text(
                  'Select Day to set a schedule',
                  style: AppFonts.grey14w400,
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_days.length, (i) {
                    final isSelected = i == _selectedDayIndex;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedDayIndex = i),
                      child: Container(
                        height: 45.w,
                        width: 45.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.orange
                                : AppColors.textGrey.withOpacity(0.3),
                          ),
                        ),
                        alignment: .center,
                        child: Text(
                          _days[i],
                          style: (AppFonts.black20w500).copyWith(
                            color: isSelected ? AppColors.orange : null,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 34.h),

                Text(_dayName(_selectedDayIndex), style: AppFonts.black18w400),
                SizedBox(height: 16.h),
                Divider(
                  height: 0.h,
                  color: AppColors.textGrey.withValues(alpha: 0.2),
                ),
                SizedBox(height: 24.h),

                GestureDetector(
                  onTap: _openSetTime,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Row(
                      children: [
                        Text('Starts', style: AppFonts.grey16w400),
                        SizedBox(width: 12.w),
                        Icon(
                          Icons.arrow_forward,
                          size: 16.sp,
                          color: AppColors.textGrey,
                        ),
                        SizedBox(width: 12.w),
                        Text('Ends', style: AppFonts.grey16w400),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              '${_formatTime(_startTime)}',
                              style: AppFonts.black16w500,
                            ),
                            SizedBox(width: 4.w),
                            Text("AM", style: AppFonts.grey16w500),
                            SizedBox(width: 12.w),
                            Icon(
                              Icons.arrow_forward,
                              size: 16.sp,
                              color: AppColors.textGrey,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              '${_formatTime(_endTime)}',
                              style: AppFonts.black16w500,
                            ),
                            SizedBox(width: 4.w),
                            Text("PM", style: AppFonts.grey16w500),
                          ],
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.chevron_right,
                          size: 24.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(
                  height: 0.h,
                  color: AppColors.textGrey.withOpacity(0.2),
                ),
                SizedBox(height: 24.h),

                GestureDetector(
                  onTap: _openGuidanceNote,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Guidance Note', style: AppFonts.grey16w400),
                        Icon(
                          Icons.chevron_right,
                          size: 24.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                Row(
                  children: [
                    const Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        iconAlignment: .end,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          TablerIcons.circleCheck,
                          size: 24.sp,
                          color: AppColors.white,
                        ),
                        label: const Text('Save Schedule'),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
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
                          children: [
                            Text('Cancel', style: AppFonts.black14w400),
                            SizedBox(width: 4.w),
                            Icon(
                              TablerIcons.trash,
                              size: 24.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                  border: .all(color: AppColors.dividerColor),
                ),
                alignment: .center,
                child: Center(
                  child: Icon(
                    TablerIcons.playstationX,
                    size: 30.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
