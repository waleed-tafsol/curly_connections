import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import '../app_drop_down.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final ValueNotifier<int> _selectedType = ValueNotifier(
    0,
  ); // 0=Upcoming, 1=Completed
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  String get _formattedDate {
    if (_selectedDate == null) return 'April 24, Friday';
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[_selectedDate!.month - 1]} ${_selectedDate!.day}, ${days[_selectedDate!.weekday - 1]}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.secondary,
            onPrimary: AppColors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _formattedDate;
      });
    }
  }

  @override
  void dispose() {
    _selectedType.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _dateController.text = 'April 24, Friday';
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
              Text("Filter", style: AppFonts.black32w400),
              SizedBox(height: 16.h),

              Text("Booking Type", style: AppFonts.black14w500),
              SizedBox(height: 10.h),

              // ── Upcoming / Completed toggle ──
              ValueListenableBuilder<int>(
                valueListenable: _selectedType,
                builder: (context, selected, _) {
                  return Row(
                    children: [
                      _bookingTypeChip(
                        label: 'Upcoming',
                        index: 0,
                        selected: selected,
                      ),
                      SizedBox(width: 10.w),
                      _bookingTypeChip(
                        label: 'Completed',
                        index: 1,
                        selected: selected,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 12.h),

              Text("Date", style: AppFonts.black13w400),
              SizedBox(height: 7.h),

              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextField(
                    readOnly: true,
                    style: AppFonts.black14w400,
                    controller: _dateController,
                    decoration: const InputDecoration(
                      hintText: 'April 24, Friday',
                      suffixIcon: Icon(TablerIcons.calendarDue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              Text("Service", style: AppFonts.black13w400),
              SizedBox(height: 7.h),
              AppDropdown<String>(
                hPadding: 16.w,
                items: const ['Option 1', 'Option 2'],
                builder: (item) => Text(item),
                onChanged: (_) {},
                hint: 'Select Service',
                broderColor: AppColors.textFeildStroke,
              ),
              SizedBox(height: 56.h),

              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          TablerIcons.arrowRight,
                          size: 24.sp,
                          color: AppColors.white,
                        ),
                        label: const Text('Apply Filter'),
                      ),
                    ),
                  ],
                ),
              ),
             SizedBox(height: MediaQuery.paddingOf(context).bottom + 24.h),
            ],
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
    );
  }

  Widget _bookingTypeChip({
    required String label,
    required int index,
    required int selected,
  }) {
    final isSelected = selected == index;
    return GestureDetector(
      onTap: () => _selectedType.value = index,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brown : AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: isSelected
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.5),
                    blurRadius: 10.r,
                  ),
                ],
          border: Border.all(color: AppColors.white),
        ),
        child: Text(
          label,
          style: isSelected ? AppFonts.white15w500 : AppFonts.black15w500,
        ),
      ),
    );
  }
}
