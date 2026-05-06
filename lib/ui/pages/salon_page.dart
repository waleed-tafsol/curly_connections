import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_divider.dart';
import '../widgets/app_tab_item.dart';
import '../widgets/review_container.dart';

class SalonPage extends StatefulWidget {
  static const String routeName = '/salon_page';
  const SalonPage({super.key});

  @override
  State<SalonPage> createState() => _SalonPageState();
}

class _SalonPageState extends State<SalonPage> {
  final _tabNotifier = ValueNotifier(0);
  static const _tabItems = ['Previous Works', 'Reviews', 'About'];

  @override
  void dispose() {
    _tabNotifier.dispose();
    super.dispose();
  }

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
        title: Text('Back', style: AppFonts.black14w500),
        titleSpacing: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        child: SafeArea(child: _buildBody()),
      ),
    );
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: 30.h),
        _buildTitleRow(),
        SizedBox(height: 14.h),
        Row(
          spacing: 6.w,
          children: [
            Icon(TablerIcons.mapPin, size: 18.sp, color: AppColors.orange),
            Text('East Side • 1.5 km away', style: AppFonts.black14w400),
          ],
        ),
        SizedBox(height: 22.h),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('FULL COLOR + TREATMENT', style: AppFonts.grey14w400),
            SizedBox(
              width: 120.w,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.black,
                ),
                onPressed: () {},
                label: const Text('Book Now'),
                icon: const Icon(TablerIcons.arrowRight),
                iconAlignment: IconAlignment.end,
              ),
            ),
          ],
        ),
        AppDivider(margin: EdgeInsets.symmetric(vertical: 22.h)),
        ValueListenableBuilder(
          valueListenable: _tabNotifier,
          builder: (_, selectedIndex, _) {
            return Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 12.w,
                      children: List.generate(_tabItems.length, (index) {
                        return AppTabItem(
                          title: _tabItems[index],
                          isSelected: index == selectedIndex,
                          onTap: () => _tabNotifier.value = index,
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 22.h),
                  Expanded(
                    child: switch (selectedIndex) {
                      0 => _buildPreviousWorks(),
                      1 => _buildReviews(),
                      2 => _buildAbout(),
                      int() => throw UnimplementedError(),
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Row _buildTitleRow() {
    return Row(
      spacing: 9.w,
      children: [
        CircleAvatar(radius: 25.r, backgroundColor: AppColors.white),
        Column(
          crossAxisAlignment: .start,
          spacing: 2.h,
          children: [
            Text('Sarah Mendoza', style: AppFonts.black16w400),
            Text('Member since 2020', style: AppFonts.grey10w400),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: AppColors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Row(
            spacing: 6.w,
            children: [
              Container(
                height: 24.w,
                width: 24.w,
                decoration: const BoxDecoration(
                  color: AppColors.lightOrange,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  TablerIcons.starFilled,
                  size: 16.sp,
                  color: AppColors.orange,
                ),
              ),
              Text('4.7', style: AppFonts.black14w500),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreviousWorks() {
    return GridView.builder(
      itemCount: 50,
      padding: EdgeInsets.only(
        bottom: MediaQuery.paddingOf(context).bottom + 30.h,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 11.w,
        childAspectRatio: 116.w / 86.h,
      ),
      itemBuilder: (_, index) {
        return Container(
          width: 116.w,
          height: 86.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: const DecorationImage(
              image: AssetImage(DummyAssets.hair),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildReviews() {
    return ListView.separated(
      itemCount: 25,
      padding: EdgeInsets.only(
        bottom: MediaQuery.paddingOf(context).bottom + 30.h,
      ),
      separatorBuilder: (_, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        return const ReviewContainer();
      },
    );
  }

  Widget _buildAbout() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.paddingOf(context).bottom + 30.h,
      ),
      child: Text(
        'Figma ipsum component variant main layer. Selection layer flatten background layout. Layer italic undo main group inspect draft plugin pencil comment. Rotate rotate hand figjam list device create vector main. Underline variant list stroke slice ipsum auto prototype. Variant plugin flows union duplicate select mask. Undo vector link duplicate union subtract. Horizontal clip move select blur plugin pen. Undo duplicate scrolling undo rotate. Mask mask vertical blur undo shadow share scrolling layer invite. Bullet union strikethrough scrolling edit asset main auto asset. Move bold text reesizing boolean boolean device. Clip pen invite auto hand. Group rotate library underline stroke italic',
        style: AppFonts.black16w400.copyWith(height: 1.66),
      ),
    );
  }
}
