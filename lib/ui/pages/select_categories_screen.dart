import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/categaory_chip.dart';
import '../widgets/custom_appbar_back_button.dart';
import 'set_schedule_screen.dart';

class SelectCategoriesScreen extends StatefulWidget {
  static const String routeName = '/select_categories';
  const SelectCategoriesScreen({super.key});

  @override
  State<SelectCategoriesScreen> createState() => _SelectCategoriesScreenState();
}

class _CategorySection {
  final String title;
  final List<String> subCategories;
  bool isExpanded;
  Set<String> selectedChips;

  _CategorySection({
    required this.title,
    required this.subCategories,
    this.isExpanded = false,
    Set<String>? selectedChips,
  }) : selectedChips = selectedChips ?? {};
}

class _SelectCategoriesScreenState extends State<SelectCategoriesScreen> {
  final List<_CategorySection> _sections = [
    _CategorySection(
      title: 'Hairs',
      subCategories: [
        'Haircuts & Styling',
        'Hair Coloring',
        'Hair Size',
        'Hair Treatments',
        'Hair Length',
        'knotless & normal',
        'Grooming Services',
        'Hair Extensions & Wigs',
      ],
      isExpanded: true,
      selectedChips: {'Hair Coloring'},
    ),
    _CategorySection(
      title: 'Facials',
      subCategories: [
        'Basic Facial',
        'Anti-Aging Facial',
        'Acne Treatment',
        'Brightening Facial',
      ],
    ),
    _CategorySection(
      title: 'Body Treatments',
      subCategories: [
        'Body Wrap',
        'Scrub & Exfoliation',
        'Massage Therapy',
        'Detox Treatment',
      ],
    ),
  ];

  void _toggleChip(_CategorySection section, String chip) {
    setState(() {
      if (section.selectedChips.contains(chip)) {
        section.selectedChips.remove(chip);
      } else {
        section.selectedChips.add(chip);
      }
    });
  }

  void _clearSelection(_CategorySection section) {
    setState(() {
      section.selectedChips.clear();
    });
  }

  void _toggleSection(_CategorySection section) {
    setState(() {
      section.isExpanded = !section.isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarBackButton(
        onNext: () {
          Navigator.pushNamed(context, SetScheduleScreen.routeName);
        },
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 132.h),
              Text(
                'Select categories',
                style: AppFonts.black20w400.copyWith(height: 1.5),
              ),
              SizedBox(height: 4.h),
              Text(
                'Select the services categories you work in to let you set your schedules',
                style: AppFonts.grey12w400.copyWith(height: 1.5),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16.r),
                  border: .all(color: AppColors.white),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: _sections.length,
                  separatorBuilder: (_, _) => SizedBox(height: 22.h),
                  itemBuilder: (context, index) {
                    final section = _sections[index];
                    final selectedCount = section.selectedChips.length;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Category Header Row ──
                        GestureDetector(
                          onTap: () => _toggleSection(section),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => _toggleSection(section),
                                child: Container(
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(
                                      color: section.isExpanded
                                          ? AppColors.secondary
                                          : AppColors.white,
                                      width: 1.5.w,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: section.isExpanded
                                      ? Icon(
                                          Icons.check,
                                          size: 14.sp,
                                          color: AppColors.secondary,
                                        )
                                      : null,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Text(section.title, style: AppFonts.black16w500),
                            ],
                          ),
                        ),

                        // ── Expanded Content ──
                        if (section.isExpanded) ...[
                          SizedBox(height: 22.h),

                          // selected count + clear
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$selectedCount selected',
                                style: AppFonts.grey12w400,
                              ),
                              GestureDetector(
                                onTap: () => _clearSelection(section),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cancel_outlined,
                                      size: 18.sp,
                                      color: AppColors.black,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      'CLEAR SELECTION',
                                      style: AppFonts.black12w500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10.h),

                          // ── Chips Wrap ──
                          // ── Chips Wrap ──
                          SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              spacing: 12.w,
                              runSpacing: 12.h,
                              children: section.subCategories.map((chip) {
                                final isSelected = section.selectedChips
                                    .contains(chip);
                                return GestureDetector(
                                  onTap: () => _toggleChip(section, chip),
                                  child: CategaoryChip(
                                    title: chip,
                                    isSelected: isSelected,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
