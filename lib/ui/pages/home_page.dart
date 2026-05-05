import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_divider.dart';
import '../widgets/app_items_list_view.dart';
import '../widgets/booking_summary.dart';
import '../widgets/upcoming_agenda.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        _buildAppBar(),
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

  Widget _buildAppBar() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.r,
        backgroundColor: AppColors.white,
        child: const Center(),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      title: Text('Sarah Mendoza', style: AppFonts.black16w500),
      subtitle: Container(
        padding: EdgeInsets.only(top: 2.h),
        alignment: Alignment.centerLeft,
        child: Chip(
          backgroundColor: AppColors.peach,
          side: const BorderSide(color: AppColors.orange),
          label: Text('Free Plan', style: AppFonts.black10w500),
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(TablerIcons.bell),
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
