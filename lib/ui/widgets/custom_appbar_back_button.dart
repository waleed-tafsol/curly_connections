import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class CustomAppBarBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSkip;

  const CustomAppBarBackButton({super.key, this.onBack, this.onSkip});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      toolbarHeight: kToolbarHeight.h,
       systemOverlayStyle: const SystemUiOverlayStyle( 
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,   
    statusBarBrightness: Brightness.light,       
  ),

      leadingWidth: 62.w,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8),
            margin: EdgeInsets.only(right: 18.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: .all(Radius.circular(12.r)),
            ),
            child: Row(
              children: [
                Text("Next", style: AppFonts.black14w500),
                SizedBox(width: 12.w),
                Icon(
                  CupertinoIcons.chevron_right,
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ],
      leading: Padding(
        padding: EdgeInsets.only(left: 16.0.w),
        child: GestureDetector(
          onTap: () {
            if (onBack != null) {
              onBack!.call();
            } else {
              Navigator.pop(context);
            }
          },
          child: Row(
            children: [
              Icon(CupertinoIcons.chevron_left, size: 20.sp),
              SizedBox(width: 5.w),
              Text("Back", style: AppFonts.black14w500),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
