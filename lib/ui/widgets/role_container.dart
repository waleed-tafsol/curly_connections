import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class RoleContainer extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;
  const RoleContainer({
    super.key,
    required this.isSelected,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(22.r),
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: AppColors.lightPeach,
              borderRadius: BorderRadius.circular(22.r),
              border: .all(
                color: isSelected ? AppColors.borderPurple : Colors.white,
              ),
            ),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Text(title, style: AppFonts.black20w400),
                SizedBox(height: 10.sp),
                Image.asset(imagePath, height: 100.sp, width: 100.sp),
                SizedBox(height: 10.sp),
                Text(
                  description,
                  style: AppFonts.black12w400.copyWith(height: 1.3),
                  textAlign: .center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
