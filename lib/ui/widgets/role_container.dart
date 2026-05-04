import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class RoleContainer extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String description;
  final String imagePath;
  const RoleContainer({super.key, required this.isSelected,required this.title,required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          gradient: AppColors.gradientPurpleToPeach,
          borderRadius: BorderRadius.circular(22.r),
          border: .all(
            color: isSelected ? AppColors.borderPurple : Colors.white,
          ),
        ),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Text(title, style: AppFonts.black20w400),
            SizedBox(height: 10.h),
            Image.asset(imagePath, height: 100.h, width: 100.h),
            SizedBox(height: 10.h),
            Text(
             description,
              style: AppFonts.black12w400,
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
