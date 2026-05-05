import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/bottom_nav_view_model.dart';
import '../widgets/salomon_bottom_bar.dart';
import 'home_page.dart';

class BottomNavPage extends StatelessWidget {
  static const String routeName = '/bottom_nav_page';
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavViewModel = context.watch<BottomNavViewModel>();
    final userType = context.read<AuthViewModel>().userType;
    final currentPage = bottomNavViewModel.currentPage;
    final items = bottomNavViewModel.getBottomBarItems(userType);
    return Scaffold(
      extendBody: true,
      body: Container(
        // decoration: BoxDecoration(
        //   gradient:
        // ),
        child: switch (currentPage) {
          0 => const HomePage(),
          1 => const ColoredBox(color: Colors.yellowAccent, child: Center()),
          2 => const ColoredBox(color: Colors.purpleAccent, child: Center()),
          3 => const ColoredBox(color: Colors.redAccent, child: Center()),
          int() => throw UnimplementedError(),
        },
      ),
      bottomNavigationBar: Container(
        width: 380.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: AppColors.pink, width: 2.sp),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SalomonBottomBar(
          onTap: (newIndex) => bottomNavViewModel.setCurrentPage(newIndex),
          currentIndex: currentPage,
          margin: EdgeInsets.all(8.w),
          selectedItemColor: AppColors.primaryLight,
          itemShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99.r),
            side: const BorderSide(color: AppColors.primary),
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
    );
  }
}
