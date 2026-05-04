import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract final class AppFonts {
  static const String fontFamily = 'HelveticaNeue';

  static const TextStyle _base = TextStyle(fontFamily: fontFamily, height: 0);

  static final black12w500 = _base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static final black16w400 = black12w400.copyWith(fontSize: 16.sp);
  static final black22w400 = _base.copyWith(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static final black12w400 = _base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static final black20w400 = _base.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static final black14w400 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static final black14w500 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static final white14w500 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final grey16w400 = _base.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
  );
  static final grey14w500 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textGrey,
  );
  static final grey14w400 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
  );
  static final yellow14w400 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textYellow,
  );
}
