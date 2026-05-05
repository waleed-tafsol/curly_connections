import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      height: 1.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: kElevationToShadow[1],
      ),
    );
  }
}
