import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar.dart';

class PortfolioScreen extends StatelessWidget {
  static const String routeName = '/portfolio_screen';

  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: 'Portfolio'),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                // Row(
                //   children: [
                //     GestureDetector(
                //       onTap: (){
                //         Navigator.pop(context);
                //       },
                //       child: Container(
                //         padding: EdgeInsets.all(7.w),
                //         decoration: BoxDecoration(
                //           color: AppColors.primary,
                //           borderRadius: BorderRadius.circular(12.r),
                //           border: Border.all(
                //             color: AppColors.white,
                //           ),
                //         ),
                //         child: Icon(CupertinoIcons.chevron_left, size: 20.sp),
                //       ),
                //     ),
                //     SizedBox(width: 12.w),
                //     Text('Portfolio', style: AppFonts.black20w400),
                //   ],
                // ),
                // SizedBox(height: 25.h),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: AppColors.fillColor,
                    radius: Radius.circular(20.r),
                    dashPattern: [4, 5],
                    strokeWidth: 2.w,
                    padding: EdgeInsets.zero,
                  ),

                  // [dashWidth, gapWidth]
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(SvgAssets.photo, height: 48.sp),
                        SizedBox(height: 8.h),
                        Text(
                          'Upload Portfolio Images',
                          style: AppFonts.black16w500,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Upload photos of your past works to showcase the clients looking for stylists',
                          textAlign: TextAlign.center,
                          style: AppFonts.grey14w400.copyWith(
                            height: 1.36,
                            color: const Color(0xFF0B0B0B),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                TablerIcons.upload,
                                color: AppColors.white,
                                size: 20.sp,
                              ),
                              SizedBox(width: 5.w),
                              Text('Choose Files', style: AppFonts.white15w500),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Text(
                      'PHOTOS GALLERY',
                      style: AppFonts.grey12w400.copyWith(
                        color: const Color(0xFF0B0B0B),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(48)',
                      style: AppFonts.grey12w400.copyWith(
                        color: const Color(0xFF0B0B0B),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Text('SELECT PHOTOS', style: AppFonts.black12w500),
                    ),
                    Row(
                      children: [
                        Text('SORT BY', style: AppFonts.black12w500),
                        SvgPicture.asset(
                          SvgAssets.reviewArrowDown,
                          height: 18.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Image Wrap
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: List.generate(
                        12,
                        (index) => Stack(
                          children: [
                            Container(
                              width: 116.w,
                              height: 86.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: const DecorationImage(
                                  image: AssetImage(DummyAssets.saloon),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Positioned(
                            //   top: 5.h,
                            //   right: 5.w,
                            //   child: Container(
                            //     width: 20.w,
                            //     height: 20.w,
                            //     decoration: BoxDecoration(
                            //       color: Colors.black.withOpacity(0.24),
                            //       shape: BoxShape.circle,
                            //     ),
                            //     child: Icon(Icons.close, size: 14.sp, color: AppColors.white),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
