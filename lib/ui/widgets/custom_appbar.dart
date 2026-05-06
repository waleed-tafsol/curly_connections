import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,

      title: Row(
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.white,
                ),
              ),
              child: Icon(CupertinoIcons.chevron_left, size: 20.sp),
            ),
          ),
          // GestureDetector(
          //   onTap: onBack ?? () => Navigator.pop(context),
          //   child: Container(
          //     padding: const EdgeInsets.all(7),
          //     decoration: BoxDecoration(
          //       color: AppColors.primary,
          //       borderRadius: BorderRadius.circular(12),
          //       border: Border.all(color: AppColors.white),
          //     ),
          //     child: const Icon(
          //       CupertinoIcons.chevron_left,
          //       size: 20,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
           SizedBox(width: 12.w),
          Text(
            title,
            style: AppFonts.black20w400,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}