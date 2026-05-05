import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class AppCurrentLocationCard extends StatelessWidget {
  const AppCurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 230.w,
        margin: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.orange),
          color: AppColors.white.withValues(alpha: 0.7),
        ),
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Icon(TablerIcons.pin, size: 24.sp, color: AppColors.orange),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('CURRENT LOCATION', style: AppFonts.grey10w400),
                  Text(
                    '221B Baker Street, Norway',
                    style: AppFonts.black14w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
