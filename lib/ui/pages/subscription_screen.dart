import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar_back_button.dart';

class SubscriptionScreen extends StatefulWidget {
  static const String routeName = '/subscription';
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBarBackButton(),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 117.5.h),
              Text("Subscription Plans", style: AppFonts.black20w400),
              SizedBox(height: 4.h),
              Text(
                "Choose the plan that suits you!",
                style: AppFonts.grey12w400,
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.only(top: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: .all(color: AppColors.black),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.w),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text("Starter", style: AppFonts.black30w700),
                          SizedBox(height: 10.h),
                          Text(
                            "Manage Bookings with Ease",
                            style: AppFonts.black18w400,
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  value: true,
                                  onChanged: (_) {},
                                  activeColor: AppColors.mediumPurple,
                                  activeTrackColor: AppColors.mediumPurple,
                                  activeThumbColor: AppColors.white,
                                  inactiveThumbColor: AppColors.white,
                                  inactiveTrackColor: AppColors.white,
                                ),
                              ),

                              Text(
                                "billed annually",
                                style: AppFonts.grey16w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 38.h),
                    Padding(
                      padding: EdgeInsetsGeometry.only(right: 16.w),
                      child: Divider(height: 0.h, color: AppColors.black),
                    ),
                    SizedBox(height: 32.h),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.w),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              Text("20", style: AppFonts.black36w500),
                              Text(
                                '/per month billed annually',
                                style: AppFonts.grey16w400,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Text("or", style: AppFonts.grey16w400),
                              Text(
                                ' kr24 billed monthly',
                                style: AppFonts.black16w500,
                              ),
                            ],
                          ),

                          SizedBox(height: 32.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: AppFonts.white20w500,
                            ),
                            onPressed: () {
                              // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                            },
                            child: const Text("Get Started"),
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(height: 0.h, color: AppColors.white),
                    ),
                    SizedBox(width: 16.w),
                    Text("OR", style: AppFonts.grey10w400),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Divider(height: 0.h, color: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Image.asset(
                  PngAssets.dollarLocation,
                  width: 33.w,
                  height: 32.h,
                ),
              ),
              SizedBox(height: 5.h),
              Center(
                child: Text(
                  "Start your Free Trial",
                  style: AppFonts.black16w500,
                ),
              ),
              SizedBox(height: 5.h),
              Center(
                child: Text(
                  "Explore what we have to serve you with a 30 days trial",
                  style: AppFonts.black12w400,
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  child: const Text("Strat Now"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
