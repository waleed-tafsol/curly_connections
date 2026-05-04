import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/categaory_chip.dart';

class ChipScreen extends StatelessWidget {
  static const String routeName = "/chip_screen";
  const ChipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chip Screen")),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50.r),
                    border: .all(color: AppColors.white, width: 2.w),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Icon(TablerIcons.circleX, size: 13.sp),
                      SizedBox(width: 8.w),
                      Text("Hair Coloring", style: AppFonts.black14w400),
                    ],
                  ),
                ),
                const CategaoryChip(isSelected: false),
                const CategaoryChip(isSelected: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
