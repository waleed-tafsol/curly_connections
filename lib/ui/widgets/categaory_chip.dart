import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class CategaoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CategaoryChip({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: isSelected ? AppColors.orange : AppColors.white,
          width: 2.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: .min,
        children: [
          if (isSelected)
            Icon(TablerIcons.circleX, size: 13.sp, color: AppColors.black),
          if (isSelected) SizedBox(width: 8.w),
          Text(title, style: AppFonts.black14w400),
        ],
      ),
    );
  }
}
