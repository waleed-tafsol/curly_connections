import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class MapExplorePage extends StatelessWidget {
  static const String routeName = '/map_explore_page';
  const MapExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(TablerIcons.chevronLeft),
        ),
        title: Text('BACK TO HOME', style: AppFonts.black12w500),
        titleSpacing: 0,
      ),
      body: DecoratedBox(
        decoration:  BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: Image.asset(DummyAssets.largeMap, fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
