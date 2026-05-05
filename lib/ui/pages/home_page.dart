import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_divider.dart';
import '../widgets/app_items_list_view.dart';
import '../widgets/booking_summary.dart';

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
                // const AppItemsListView(
                //   title: 'Upcoming agenda',
                //   emptyItemsTitle:
                //       'You have not get any upcoming bookings yet, the bookings will appear here as you got any.',
                // ),
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
}
