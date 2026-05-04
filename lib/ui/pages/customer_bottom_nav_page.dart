import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/bottom_nav_view_model.dart';
import '../widgets/salomon_bottom_bar.dart';

class CustomerBottomNavPage extends StatelessWidget {
  static const String routeName = '/customer_bottom_nav_page';
  const CustomerBottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ColoredBox(color: Colors.pinkAccent, child: Center()),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 380.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColors.pink, width: 2.sp),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Consumer<BottomNavViewModel>(
            builder: (_, viewModel, _) {
              return SalomonBottomBar(
                onTap: (newIndex) => viewModel.setCurrentPage(newIndex),
                currentIndex: viewModel.currentPage,
                margin: EdgeInsets.all(8.w),
                selectedItemColor: AppColors.primaryLight,
                itemShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99.r),
                  side: const BorderSide(color: AppColors.primary),
                ),
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(
                      TablerIcons.home,
                      color: AppColors.secondary,
                    ),
                    title: Text('Home', style: AppFonts.black16w400),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      TablerIcons.scissors,
                      color: AppColors.secondary,
                    ),
                    title: Text('My Bookings', style: AppFonts.black16w400),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      TablerIcons.calendarWeek,
                      color: AppColors.secondary,
                    ),

                    title: Text('Calendar', style: AppFonts.black16w400),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      TablerIcons.user,
                      color: AppColors.secondary,
                    ),
                    title: Text('Profile', style: AppFonts.black16w400),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
