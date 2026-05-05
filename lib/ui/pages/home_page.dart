import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/app_current_location_card.dart';
import '../widgets/app_divider.dart';
import '../widgets/app_drop_down.dart';
import '../widgets/app_items_list_view.dart';
import '../widgets/booking_summary.dart';
import '../widgets/upcoming_agenda.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel, UserType>(
      selector: (_, vm) => vm.userType,
      builder: (_, userType, _) {
        return switch (userType) {
          UserType.stylist => _buildStylistView(context),
          UserType.client => _buildClientView(context),
        };
      },
    );
  }

  Column _buildStylistView(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: _buildAppBar(name: 'Sarah Mendoza', plan: 'Free Plan'),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 20.h),
                const BookingSummary(),
                const AppDivider(),
                AppItemsListView(
                  title: 'Recent Requests',
                  emptyItemsTitle:
                      'You have not get any requests yet, the requests will appear here as you receive any.',
                  items: List.generate(4, (index) => 'Elena K.'),
                ),
                const AppDivider(),
                _buildUpcomingAgenda(),
                SizedBox(height: MediaQuery.paddingOf(context).bottom + 30.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClientView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _buildClientTopView(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('FOR YOU', style: AppFonts.grey12w400),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text('Top Rated Near You', style: AppFonts.black24w300),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          log('Hello');
                        },
                        child: Row(
                          children: [
                            Text('See All', style: AppFonts.black12w500),
                            Icon(TablerIcons.chevronRight, size: 25.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildClientMap(),
                  SizedBox(height: 8.h),
                  for (int i = 0; i < 10; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: const UpcomingAgenda(),
                    ),
                  SizedBox(height: MediaQuery.paddingOf(context).bottom + 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildClientMap() {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        image: const DecorationImage(
          image: AssetImage(DummyAssets.smallMap),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.white),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          const AppCurrentLocationCard(),
          // const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(15.r),
                  child: Ink(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: AppColors.lightOrange),
                      color: AppColors.white,
                    ),
                    child: Icon(TablerIcons.currentLocation, size: 20.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildClientTopView() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.white),
        gradient: AppColors.gradientPeachToPurple,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _buildAppBar(name: 'Olivia Bennett', plan: 'Starter Plan'),
          AppDivider(margin: EdgeInsets.symmetric(vertical: 24.h)),
          Text('Find Your Perfect Stylist', style: AppFonts.grey12w400),
          SizedBox(height: 14.h),
          AppDropdown<String>(
            prefixIcon: TablerIcons.cut,
            items: const ['Option 1', 'Option 2'],
            builder: (item) => Text(item),
            onChanged: (_) {},
            hint: 'Service Type',
          ),
          SizedBox(height: 14.h),
          AppDropdown<String>(
            prefixIcon: TablerIcons.mapPin,
            items: const ['Option 1', 'Option 2'],
            builder: (item) => Text(item),
            onChanged: (_) {},
            hint: 'Location',
          ),
          SizedBox(height: 14.h),
          AppDropdown<String>(
            prefixIcon: TablerIcons.calendarDue,
            items: const ['Option 1', 'Option 2'],
            builder: (item) => Text(item),
            onChanged: (_) {},
            hint: 'Schedule',
          ),
          SizedBox(height: 14.h),
          ElevatedButton(onPressed: () {}, child: const Text('Find a Match')),
        ],
      ),
    );
  }

  Widget _buildAppBar({required String name, required String plan}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.w,
        backgroundColor: AppColors.white,
        child: const Center(),
      ),
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      minVerticalPadding: 0,
      title: Text(name, style: AppFonts.black16w500),
      subtitle: Container(
        padding: EdgeInsets.only(top: 2.h),
        alignment: Alignment.centerLeft,
        child: Chip(
          backgroundColor: AppColors.peach,
          side: const BorderSide(color: AppColors.orange),
          label: Text(plan, style: AppFonts.black10w500),
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        ),
      ),
      trailing: Row(
        mainAxisSize: .min,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(TablerIcons.bell)),
          IconButton(onPressed: () {}, icon: const Icon(TablerIcons.language)),
        ],
      ),
    );
  }

  Widget _buildUpcomingAgenda() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('UPCOMING AGENDA', style: AppFonts.grey12w400),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text('Today, April 24', style: AppFonts.black16w400),
              const Spacer(),
              Text('CHECK CALENDAR', style: AppFonts.black12w500),
              Icon(TablerIcons.chevronRight, size: 25.sp),
            ],
          ),
          SizedBox(height: 8.h),
          ...List.generate(
            4,
            (_) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const UpcomingAgenda(),
            ),
          ),
        ],
      ),
    );
  }
}
