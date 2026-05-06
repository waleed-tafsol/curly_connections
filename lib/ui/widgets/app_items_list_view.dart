import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import 'service_request.dart';

class AppItemsListView<T> extends StatefulWidget {
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
  State<AppItemsListView<T>> createState() => _AppItemsListViewState<T>();
}

class _AppItemsListViewState<T> extends State<AppItemsListView<T>> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(widget.title.toUpperCase(), style: AppFonts.grey12w400),
        ),
        if (widget.items.isEmpty) ...{
          SizedBox(
            height: 200.h,
            child: Center(child: SvgPicture.asset(SvgAssets.flower)),
          ),
          SizedBox(height: 12.h),
          Center(
            child: SizedBox(
              width: 0.7.sw,
              child: Text(
                widget.emptyItemsTitle ?? 'No items found!',
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
            itemCount: widget.items.length,
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            padEnds: true,
            itemBuilder: (_, _) => const ServiceRequest(),
          ),
        ),
        SizedBox(height: 12.h),
        ListenableBuilder(
          listenable: _pageController,
          builder: (_, _) {
            final currentPage = _pageController.page?.toInt();
            return SingleChildScrollView(
              child: Row(
                mainAxisAlignment: .center,
                spacing: 8.w,
                children: List.generate(widget.items.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: currentPage == index ? 5.h : 2.5.h,
                    width: 57.w,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(
                        alpha: currentPage == index ? 1 : 0.7,
                      ),
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}
