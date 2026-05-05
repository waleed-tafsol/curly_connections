import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class PortfolioScreen extends StatelessWidget {

  static const String routeName = '/portfolio_screen';

  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            child: Column(
              spacing: 20.h,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(7.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.white,
                          )
                        ),
                        child: Icon(CupertinoIcons.chevron_left, size: 20.sp)),
                    SizedBox(width: 12.w,),
                    Text('Portfolio', style: AppFonts.black20w400),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }


}




