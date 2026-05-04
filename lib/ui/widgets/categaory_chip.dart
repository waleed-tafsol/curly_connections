import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class CategaoryChip extends StatelessWidget {
  final bool isSelected;
  const CategaoryChip({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50.r),
        border: .all(
          color: isSelected ? AppColors.orange : AppColors.white,
          width: 2.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          if (isSelected) Icon(TablerIcons.circleX, size: 13.sp),
          if (isSelected) SizedBox(width: 8.w),
          Text("Hair Coloring", style: AppFonts.black14w400),
        ],
      ),
    );
  }
}
