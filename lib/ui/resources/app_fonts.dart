import 'package:curly_connection/ui/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppFonts {
  static const String fontFamily = 'HelveticaNeue';

  static final TextStyle _base = TextStyle(fontFamily: fontFamily, height: 0);

  static final black12w500 = _base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
}
