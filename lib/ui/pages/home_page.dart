import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/booking_summary.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [_buildAppBar(), const BookingSummary()],
    );
  }

  Widget _buildAppBar() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.r,
        backgroundColor: AppColors.white,
        child: const Center(),
      ),
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
