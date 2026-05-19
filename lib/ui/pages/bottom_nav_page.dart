import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/bottom_nav_view_model.dart';
import '../widgets/salomon_bottom_bar.dart';
import 'calendar_booking_page.dart';
import 'client_profile_screen.dart';
import 'home_page.dart';
import 'profile_screen.dart';
import 'request_screen.dart';

class BottomNavPage extends ConsumerWidget {
  static const String routeName = '/bottom_nav_page';
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(bottomNavProvider);
    final userType = ref.read(authProvider);
    final items = ref
        .read(bottomNavProvider.notifier)
        .getBottomBarItems(userType);
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        alignment: Alignment.center,
        child: Column(
          spacing: 20.h,
          children: [
            SafeArea(
              bottom: false,
              child: Container(
                height: 1,
                width: double.infinity,
                color: AppColors.white,
              ),
            ),
            Expanded(
              child: switch (currentPage) {
                0 => const HomePage(),
                1 => const RequestScreen(),
                2 => const CalendarBookingPage(),
                3 =>
                  userType == UserType.client
                      ? const ClientProfileScreen()
                      : const ProfileScreen(),
                int() => throw UnimplementedError(),
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: 380.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColors.lightPeach, width: 2.sp),
          ),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SalomonBottomBar(
            onTap: (newIndex) =>
                ref.read(bottomNavProvider.notifier).setCurrentPage(newIndex),
            currentIndex: currentPage,
            margin: EdgeInsets.all(8.w),
            selectedItemColor: AppColors.primaryLight,
            itemShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99.r),
              side: BorderSide(color: AppColors.primary),
            ),
            items: items
                .map(
                  (item) => SalomonBottomBarItem(
                    icon: Icon(item.icon),
                    selectedColor: AppColors.secondary,
                    unselectedColor: AppColors.black,
                    title: Text(item.title, style: AppFonts.black16w400),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
