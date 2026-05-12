import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_divider.dart';
import '../widgets/upcoming_agenda.dart';

class MapExplorePage extends StatelessWidget {
  static const String routeName = '/map_explore_page';
  const MapExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 68.w,
        toolbarHeight: 66.w,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        actions: [SizedBox(width: 20.w)],
        leading: Center(
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(15.r),
            child: Ink(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(width: 1.25.w, color: AppColors.orange),
              ),
              child: Icon(TablerIcons.chevronLeft, size: 24.sp),
            ),
          ),
        ),
        title: SizedBox(
          height: 48.w,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white.withValues(alpha: 0.6),
              hintText: '221B Baker Street, Norway',
              prefixIcon: Icon(TablerIcons.mapPin, size: 18.sp),
              hintStyle: AppFonts.black14w500,
              suffixIcon: Icon(TablerIcons.chevronDown, size: 18.sp),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 2.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: SafeArea(top: false, child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          ),
          child: Image.asset(DummyAssets.largeMap, height: 417.h),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                AppDivider(margin: EdgeInsets.symmetric(vertical: 15.h)),
                Row(
                  children: [
                    Text('34 STYLIST NEAR YOU', style: AppFonts.grey12w400),
                    const Spacer(),
                    Text('FILTER', style: AppFonts.black12w500),
                    SizedBox(width: 5.w),
                    Icon(
                      TablerIcons.filter,
                      size: 25.sp,
                      color: AppColors.black,
                    ),
                    SizedBox(width: 20.w),
                    Text('SORT BY', style: AppFonts.black12w500),
                    SizedBox(width: 5.w),
                    Icon(
                      TablerIcons.sortDescending,
                      size: 25.sp,
                      color: AppColors.black,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: 34,
                    padding: EdgeInsets.only(bottom: 30.h),
                    separatorBuilder: (_, _) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      return const UpcomingAgenda(showAsSaloon: true);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
