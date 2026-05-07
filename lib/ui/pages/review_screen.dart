import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';


class ReviewScreen extends StatelessWidget {
  static const String routeName = '/review_screen';

  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        'initials': 'OB',
        'name': 'Olivia Bennett',
        'date': 'Mon, sep 2, 2024 at 18:41',
        'rating': '5.0',
        'comment': "Incredible! Terrell Haag provided the best therapy I've had ever. Also, the salon has a really pleasant atmosphere.",
      },
      {
        'initials': 'JS',
        'name': 'James Smith',
        'date': 'Tue, sep 3, 2024 at 13:15',
        'rating': '4.7',
        'comment': 'Great experience! The staff was very friendly and attentive, and the massage was top-notch.',
      },
      {
        'initials': 'AM',
        'name': 'Alice Morgan',
        'date': 'Wed, sep 4, 2024 at 11:30',
        'rating': '5.0',
        'comment': 'Absolutely wonderful! The facial treatment left my skin glowing, and I felt rejuvenated after.',
      },
      {
        'initials': 'AM',
        'name': 'Alice Morgan',
        'date': 'Wed, sep 4, 2024 at 11:30',
        'rating': '5.0',
        'comment': 'Absolutely wonderful! The facial treatment left my skin glowing, and I felt rejuvenated after.',
      },
      {
        'initials': 'AM',
        'name': 'Alice Morgan',
        'date': 'Wed, sep 4, 2024 at 11:30',
        'rating': '5.0',
        'comment': 'Absolutely wonderful! The facial treatment left my skin glowing, and I felt rejuvenated after.',
      },
    ];

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
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
                    SizedBox(width: 12.w),
                    Text('Reviews & Ratings', style: AppFonts.black20w400),
                  ],
                ),
                SizedBox(height: 25.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: reviews.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Avatar
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(review['initials'], style: AppFonts.purple18w400),
                                ),
                                SizedBox(width: 8.w),
                                // Name and Date
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(review['name'], style: AppFonts.black16w500),
                                      Text(review['date'], style: AppFonts.grey16w400),
                                    ],
                                  ),
                                ),
                                // Rating
                                Row(
                                  children: [
                                    Icon(Icons.star, color: AppColors.orange, size: 16.sp),
                                    SizedBox(width: 4.w),
                                    Text(review['rating'], style: AppFonts.black14w400),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Text(review['comment'], style: AppFonts.black16w400),
                          ],
                        ),
                      );
                    },
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