import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';
import '../resources/app_fonts.dart';
import 'service_request.dart';

class AppItemsListView<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final String? emptyItemsTitle;
  const AppItemsListView({
    super.key,
    required this.title,
    this.items = const [],
    this.emptyItemsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(title.toUpperCase(), style: AppFonts.grey12w400),
        ),
        if (items.isEmpty) ...{
          SizedBox(
            height: 200.h,
            child: Center(child: SvgPicture.asset(SvgAssets.flower)),
          ),
          SizedBox(height: 12.h),
          Center(
            child: SizedBox(
              width: 0.7.sw,
              child: Text(
                emptyItemsTitle ?? 'No items found!',
                style: AppFonts.grey12w400,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        } else
          SizedBox(height: 12.h),
        SizedBox(
          height: 230.h,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            padEnds: true,
            itemBuilder: (_, _) => const ServiceRequest(),
          ),
        ),
      ],
    );
  }
}
