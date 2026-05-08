import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class SetTimeBottomSheet extends StatefulWidget {
  final DateTime initialStart;
  final DateTime initialEnd;

  const SetTimeBottomSheet({
    super.key,
    required this.initialStart,
    required this.initialEnd,
  });

  @override
  State<SetTimeBottomSheet> createState() => _SetTimeBottomSheetState();
}

class _SetTimeBottomSheetState extends State<SetTimeBottomSheet> {
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void initState() {
    super.initState();
    _startTime = widget.initialStart;
    _endTime = widget.initialEnd;
  }

  Future<int?> _pickHour(int current) async {
    return showDialog<int>(
      context: context,
      builder: (context) => _NumberPickerDialog(
        title: 'Select Hour',
        initial: current,
        min: 0,
        max: 23,
        label: (v) => v.toString().padLeft(2, '0'),
      ),
    );
  }

  Future<int?> _pickMinute(int current) async {
    return showDialog<int>(
      context: context,
      builder: (context) => _NumberPickerDialog(
        title: 'Select Minute',
        initial: current,
        min: 0,
        max: 59,
        label: (v) => v.toString().padLeft(2, '0'),
      ),
    );
  }

  // Future<void> _pickStartTime() async {
  //   final picked = await showTimePicker(
  //     context: context,
  //     initialTime: _startTime,
  //     builder: (context, child) => _timePickerTheme(child),
  //   );
  //   if (picked != null) setState(() => _startTime = picked);
  // }

  // Future<void> _pickEndTime() async {
  //   final picked = await showTimePicker(
  //     context: context,
  //     initialTime: _endTime,
  //     builder: (context, child) => _timePickerTheme(child),
  //   );
  //   if (picked != null) setState(() => _endTime = picked);
  // }

  // Widget _timePickerTheme(Widget? child) {
  //   return Theme(
  //     data: ThemeData.light().copyWith(
  //       colorScheme: const ColorScheme.light(
  //         primary: AppColors.mediumPurple,
  //         onPrimary: AppColors.white,
  //         surface: AppColors.white,
  //       ),
  //       timePickerTheme: TimePickerThemeData(
  //         backgroundColor: AppColors.white,
  //         hourMinuteShape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12.r),
  //         ),
  //         dayPeriodShape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8.r),
  //         ),
  //       ),
  //     ),
  //     child: child!,
  //   );
  // }

  void _save() {
    Navigator.pop(context, {'start': _startTime, 'end': _endTime});
  }

  Widget _timeBox({
    required String value,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.darkPurple.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(12.r),
              border: .all(color: AppColors.darkPurple),
            ),
            alignment: Alignment.center,
            child: Text(
              value,
              style: AppFonts.black36w500.copyWith(color: AppColors.darkPurple),
            ),
          ),
          SizedBox(height: 7.h),
          Text(label, style: AppFonts.black12w400),
        ],
      ),
    );
  }

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
              // // Back button
              // GestureDetector(
              //   onTap: () => Navigator.pop(context),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Icon(
              //         TablerIcons.chevronLeft,
              //         size: 24.sp,
              //         color: AppColors.black,
              //       ),
              //       SizedBox(width: 5.w),
              //       Text('Back', style: AppFonts.black14w500),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 24.h),
              Text('Set start and end time', style: AppFonts.black20w400),
              SizedBox(height: 4.h),

              // ── Starts from ──
              Text('Starts from', style: AppFonts.grey12w400),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _timeBox(
                      value: _startTime.hour.toString().padLeft(2, '0'),
                      label: 'Hour',
                      onTap: () async {
                        final h = await _pickHour(_startTime.hour);
                        if (h != null) {
                          setState(
                            () => _startTime = _startTime.copyWith(
                              hour: h,
                              minute: _startTime.minute,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      bottom: 20.h,
                    ),
                    child: Text(':', style: AppFonts.black30w700),
                  ),
                  Expanded(
                    child: _timeBox(
                      value: _startTime.minute.toString().padLeft(2, '0'),
                      label: 'Minute',
                      onTap: () async {
                        final m = await _pickMinute(_startTime.minute);
                        if (m != null) {
                          setState(
                            () => _startTime = _startTime.copyWith(
                              hour: _startTime.hour,
                              minute: m,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Text('Ends at', style: AppFonts.grey12w400),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _timeBox(
                      value: _endTime.hour.toString().padLeft(2, '0'),
                      label: 'Hour',
                      onTap: () async {
                        final h = await _pickHour(_endTime.hour);
                        if (h != null) {
                          setState(
                            () => _endTime = _endTime.copyWith(
                              hour: h,
                              minute: _endTime.minute,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      bottom: 20.h,
                    ),
                    child: Text(':', style: AppFonts.black30w700),
                  ),
                  Expanded(
                    child: _timeBox(
                      value: _endTime.minute.toString().padLeft(2, '0'),
                      label: 'Minute',
                      onTap: () async {
                        final m = await _pickMinute(_endTime.minute);
                        if (m != null) {
                          setState(
                            () => _endTime = _endTime.copyWith(
                              hour: _endTime.hour,
                              minute: m,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: ElevatedButton.icon(
                      iconAlignment: .end,
                      onPressed: () {
                        _save();
                        //   Navigator.pop(context);
                      },
                      icon: Icon(
                        TablerIcons.circleCheck,
                        size: 24.sp,
                        color: AppColors.white,
                      ),
                      label: const Text('Save'),
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
    );
  }
}

class _NumberPickerDialog extends StatefulWidget {
  final String title;
  final int initial;
  final int min;
  final int max;
  final String Function(int) label;

  const _NumberPickerDialog({
    required this.title,
    required this.initial,
    required this.min,
    required this.max,
    required this.label,
  });

  @override
  State<_NumberPickerDialog> createState() => _NumberPickerDialogState();
}

class _NumberPickerDialogState extends State<_NumberPickerDialog> {
  late int _selected;
  late FixedExtentScrollController _scrollCtrl;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
    _scrollCtrl = FixedExtentScrollController(
      initialItem: widget.initial - widget.min,
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: AppFonts.black16w500),
            SizedBox(height: 16.h),
            SizedBox(
              height: 200.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.darkPurple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  ListWheelScrollView.useDelegate(
                    controller: _scrollCtrl,
                    itemExtent: 48.h,
                    perspective: 0.003,
                    diameterRatio: 1.8,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (i) {
                      setState(() => _selected = widget.min + i);
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: widget.max - widget.min + 1,
                      builder: (context, i) {
                        final val = widget.min + i;
                        final isSelected = val == _selected;
                        return Center(
                          child: Text(
                            widget.label(val),
                            style: isSelected
                                ? AppFonts.black30w700.copyWith(
                                    color: AppColors.darkPurple,
                                  )
                                : AppFonts.grey19w500.copyWith(
                                    color: AppColors.textGrey,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // ── Confirm / Cancel ──
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    iconAlignment: .end,
                    onPressed: () {
                      Navigator.pop(context, _selected);
                    },
                    icon: Icon(
                      TablerIcons.circleCheck,
                      size: 24.sp,
                      color: AppColors.white,
                    ),
                    label: const Text('Save'),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: GestureDetector(
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
                        mainAxisAlignment: .center,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
