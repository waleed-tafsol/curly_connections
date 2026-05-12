import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_divider.dart';
import '../widgets/review_container.dart';

class ReviewDetailScreen extends StatefulWidget {
  static const String routeName = '/review_detail_screen';
  const ReviewDetailScreen({super.key});

  @override
  State<ReviewDetailScreen> createState() => _ReviewDetailScreenState();
}

bool isReviewSubmitted = false;

class _ReviewDetailScreenState extends State<ReviewDetailScreen> {
  @override
  void initState() {
    isReviewSubmitted = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(TablerIcons.chevronLeft),
        ),
        title: Text('Back', style: AppFonts.black14w500),
        titleSpacing: 0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration:  BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,

              children: [
                SizedBox(height: 30.h),
                Text('Emma Collins', style: AppFonts.black28w300),
                SizedBox(height: 10.h),
                Text('FULL COLOR + TREATMENT', style: AppFonts.grey14w400),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(7.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            stops: [0.57, 1],
                            colors: [Color(0xffFEE1D6), Color(0xffF6E5FD)],
                          ),
                        ),
                        child: Icon(
                          TablerIcons.starFilled,
                          size: 10.sp,
                          color: AppColors.orange,
                        ),
                      ),
                      Text("4.7", style: AppFonts.black14w500),
                      Text("(15k+) Reviews", style: AppFonts.grey14w400),
                    ],
                  ),
                ),

                AppDivider(margin: EdgeInsets.symmetric(vertical: 22.h)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "FULL COLOR + TREATMENT",
                            style: AppFonts.black14w400,
                          ),
                          Text(
                            Status.confirmed.label,
                            style: AppFonts.black14w400.copyWith(
                              color: Status.confirmed.color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Divider(height: 0.h, color: AppColors.dividerColor),
                      SizedBox(height: 12.h),
                      Text("Monday", style: AppFonts.black18w400),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text("18:30", style: AppFonts.black16w500),
                          SizedBox(width: 12.w),
                          Icon(
                            TablerIcons.arrowRight,
                            color: AppColors.textGrey,
                            size: 16.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text("16:30", style: AppFonts.black16w500),
                          const Spacer(),
                          Text("• 1 hour slots", style: AppFonts.grey14w400),
                        ],
                      ),
                    ],
                  ),
                ),
                AppDivider(margin: EdgeInsets.symmetric(vertical: 22.h)),

                Text(
                  isReviewSubmitted
                      ? "Review"
                      : "How was your service with Emma?",
                  style: AppFonts.black22w300,
                ),
                SizedBox(height: 22.h),
                if (!isReviewSubmitted)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        SizedBox(height: 20.h),
                        Text("Review", style: AppFonts.black14w400),
                        SizedBox(height: 4.h),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            hintText: "Write a review",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),

                        Divider(height: 0.h, color: AppColors.dividerColor),
                        SizedBox(height: 16.h),
                        Text(
                          "Overall Satisfaction",
                          style: AppFonts.black14w400,
                        ),
                        SizedBox(height: 14.h),
                        RatingBar(
                          glow: false,
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                          ratingWidget: RatingWidget(
                            full: Container(
                              height: 45.w,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.textYellow),
                              ),
                              child: Icon(
                                TablerIcons.starFilled,
                                color: AppColors.textYellow,
                                size: 24.sp,
                              ),
                            ),
                            half: Container(
                              height: 45.w,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.textYellow),
                              ),
                              child: Icon(
                                TablerIcons.starHalfFilled,
                                color: AppColors.textYellow,
                                size: 24.sp,
                              ),
                            ),
                            empty: Container(
                              height: 45.w,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.textGrey),
                              ),
                              child: Icon(
                                TablerIcons.star,
                                color: AppColors.black,
                                size: 24.sp,
                              ),
                            ),
                          ),
                          onRatingUpdate: (double value) {
                            //  ratingViewModel.setRating(value);
                          },
                        ),
                        SizedBox(height: 34.h),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isReviewSubmitted = true;
                            });
                          },
                          label: const Text('Submit Review'),
                          icon: const Icon(TablerIcons.arrowRight),
                          iconAlignment: IconAlignment.end,
                        ),
                      ],
                    ),
                  )
                else
                  const ReviewContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
