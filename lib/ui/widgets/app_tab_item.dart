import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class AppTabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  const AppTabItem({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(99.r),
        child: Ink(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryLight : null,
            borderRadius: BorderRadius.circular(99.r),
            border: Border.all(color: AppColors.white),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Text(title, style: AppFonts.black14w400),
        ),
      ),
    );
  }
}
