import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar_back_button.dart';
import 'select_categories_screen.dart';

class TurnNotificationPage extends StatelessWidget {
  static const String routeName = '/turn_notification';
  const TurnNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarBackButton(
        onNext: () {
          Navigator.pushReplacementNamed(
            context,
            SelectCategoriesScreen.routeName,
          );
        },
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 117.5.h),
              Text("Turn on notifications", style: AppFonts.black20w400),
              SizedBox(height: 10.h),
              Text(
                "Don’t miss important messages like check-in details and account activity",
                style: AppFonts.black12w400,
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.lightPeach,
                  borderRadius: BorderRadius.circular(12.r),
                  border: .all(color: AppColors.white),
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Allow notifications to stay informed about\nyour bookings and favorite stylists.",
                      style: AppFonts.black12w400,
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        padding: EdgeInsets.zero,
                        value: false,
                        onChanged: (_) {},
                        activeThumbColor: AppColors.white,
                        activeTrackColor: AppColors.lightPeach,
                        inactiveThumbColor: AppColors.white,
                        inactiveTrackColor: AppColors.secondary,
                        trackOutlineColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        thumbColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.white;
                          }
                          return AppColors.white;
                        }),
                        trackColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.secondary;
                          }
                          return AppColors.secondary;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    SelectCategoriesScreen.routeName,
                  );
                },
                child: const Text("Yes, notify me"),
              ),
              SizedBox(height: MediaQuery.paddingOf(context).bottom + 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
