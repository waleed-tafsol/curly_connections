import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_divider.dart';
import '../widgets/app_tab_item.dart';
import '../widgets/review_container.dart';

class PortfolioScreen extends StatefulWidget {
  static const String routeName = '/portfolio_screen';

  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final _tabNotifier = ValueNotifier(0);
  static const _tabItems = ['Services', 'Previous Works', 'Reviews', 'About'];

  @override
  void dispose() {
    _tabNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: const Icon(TablerIcons.chevronLeft),
      //   ),
      //   title: Text('Back', style: AppFonts.black14w500),
      //   titleSpacing: 0,
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
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
        SizedBox(height: 22.h),
        _buildTitleRow(),

        SizedBox(height: 25.h),

        // Row(
        //   children: [
        //     Text(
        //       'PHOTOS GALLERY',
        //       style: AppFonts.grey12w400.copyWith(
        //         color: const Color(0xFF0B0B0B),
        //       ),
        //     ),
        //     SizedBox(width: 4.w),
        //     Text(
        //       '(48)',
        //       style: AppFonts.grey12w400.copyWith(
        //         color: const Color(0xFF0B0B0B),
        //       ),
        //     ),
        //   ],
        // ),
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
                  AppDivider(margin: EdgeInsets.symmetric(vertical: 22.h)),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: switch (selectedIndex) {
                      0 => _buildServices(),
                      1 => _buildPreviousWorks(),
                      2 => _buildReviews(),
                      3 => _buildAbout(),
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
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            TablerIcons.chevronLeft,
            size: 24.sp,
            color: AppColors.black,
          ),
        ),
        CircleAvatar(radius: 25.r, backgroundColor: AppColors.white),
        Column(
          crossAxisAlignment: .start,
          spacing: 2.h,
          children: [
            Text('Sarah Mendoza', style: AppFonts.black16w400),
            SizedBox(height: 2.w),
            Text('Member since 2020', style: AppFonts.grey10w400),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: AppColors.white.withValues(alpha: 0.5),
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

  Widget _buildServices() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.w),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("FULL COLOR + TREATMENT", style: AppFonts.grey14w400),
                    Text("Monday", style: AppFonts.black12w400),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: .start,
                  children: [
                    Icon(TablerIcons.hourglassEmpty, size: 16.sp),
                    SizedBox(width: 10.w),
                    Text('15:30  ', style: AppFonts.black14w500),
                    SizedBox(width: 12.w),
                    Icon(TablerIcons.arrowRight, size: 16.sp),
                    SizedBox(width: 12.w),
                    Text('16:30  ', style: AppFonts.black14w500),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPreviousWorks() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.h),

            child: Column(
              children: [
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: AppColors.fillColor,
                    radius: Radius.circular(20.r),
                    dashPattern: [4, 5],
                    strokeWidth: 2.w,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(SvgAssets.photo, height: 48.sp),
                        SizedBox(height: 8.h),
                        Text(
                          'Upload Portfolio Images',
                          style: AppFonts.black16w500,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Upload photos of your past works to showcase the clients looking for stylists',
                          textAlign: TextAlign.center,
                          style: AppFonts.grey14w400.copyWith(
                            height: 1.36,
                            color: const Color(0xFF0B0B0B),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                TablerIcons.upload,
                                color: AppColors.white,
                                size: 20.sp,
                              ),
                              SizedBox(width: 5.w),
                              Text('Choose Files', style: AppFonts.white15w500),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text(
                      'PHOTOS GALLERY',
                      style: AppFonts.grey12w400.copyWith(
                        color: const Color(0xFF0B0B0B),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(48)',
                      style: AppFonts.grey12w400.copyWith(
                        color: const Color(0xFF0B0B0B),
                      ),
                    ),
                    const Spacer(),
                    Text('SORT BY', style: AppFonts.black12w500),
                    SvgPicture.asset(SvgAssets.reviewArrowDown, height: 18.sp),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.paddingOf(context).bottom + 30.h,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, index) => Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                    image: AssetImage(DummyAssets.hair),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              childCount: 50,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 11.w,
              childAspectRatio: 116.w / 86.h,
            ),
          ),
        ),
      ],
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: const CustomAppBar(title: 'Portfolio'),
//       body: Container(
//         decoration:  BoxDecoration(
//           gradient: AppColors.gradientScafoldBackground,
//         ),
//         alignment: Alignment.center,
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header Row
//                 // Row(
//                 //   children: [
//                 //     GestureDetector(
//                 //       onTap: (){
//                 //         Navigator.pop(context);
//                 //       },
//                 //       child: Container(
//                 //         padding: EdgeInsets.all(7.w),
//                 //         decoration: BoxDecoration(
//                 //           color: AppColors.primary,
//                 //           borderRadius: BorderRadius.circular(12.r),
//                 //           border: Border.all(
//                 //             color: AppColors.white,
//                 //           ),
//                 //         ),
//                 //         child: Icon(CupertinoIcons.chevron_left, size: 20.sp),
//                 //       ),
//                 //     ),
//                 //     SizedBox(width: 12.w),
//                 //     Text('Portfolio', style: AppFonts.black20w400),
//                 //   ],
//                 // ),
//                 // SizedBox(height: 25.h),
//                 DottedBorder(
//                   options: RoundedRectDottedBorderOptions(
//                     color: AppColors.fillColor,
//                     radius: Radius.circular(20.r),
//                     dashPattern: [4, 5],
//                     strokeWidth: 2.w,
//                     padding: EdgeInsets.zero,
//                   ),

//                   // [dashWidth, gapWidth]
//                   child: Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(16.w),
//                     decoration: BoxDecoration(
//                       color: AppColors.white.withValues(alpha: 0.4),
//                       borderRadius: BorderRadius.circular(20.r),
//                     ),
//                     child: Column(
//                       children: [
//                         SvgPicture.asset(SvgAssets.photo, height: 48.sp),
//                         SizedBox(height: 8.h),
//                         Text(
//                           'Upload Portfolio Images',
//                           style: AppFonts.black16w500,
//                         ),
//                         SizedBox(height: 8.h),
//                         Text(
//                           'Upload photos of your past works to showcase the clients looking for stylists',
//                           textAlign: TextAlign.center,
//                           style: AppFonts.grey14w400.copyWith(
//                             height: 1.36,
//                             color: const Color(0xFF0B0B0B),
//                           ),
//                         ),
//                         SizedBox(height: 12.h),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 TablerIcons.upload,
//                                 color: AppColors.white,
//                                 size: 20.sp,
//                               ),
//                               SizedBox(width: 5.w),
//                               Text('Choose Files', style: AppFonts.white15w500),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 25.h),
//                 Row(
//                   children: [
//                     Text(
//                       'PHOTOS GALLERY',
//                       style: AppFonts.grey12w400.copyWith(
//                         color: const Color(0xFF0B0B0B),
//                       ),
//                     ),
//                     SizedBox(width: 4.w),
//                     Text(
//                       '(48)',
//                       style: AppFonts.grey12w400.copyWith(
//                         color: const Color(0xFF0B0B0B),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       child: Text('SELECT PHOTOS', style: AppFonts.black12w500),
//                     ),
//                     Row(
//                       children: [
//                         Text('SORT BY', style: AppFonts.black12w500),
//                         SvgPicture.asset(
//                           SvgAssets.reviewArrowDown,
//                           height: 18.sp,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20.h),

//                 // Image Wrap
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Wrap(
//                       spacing: 12.w,
//                       runSpacing: 12.h,
//                       children: List.generate(
//                         12,
//                         (index) => Stack(
//                           children: [
//                             Container(
//                               width: 116.w,
//                               height: 86.h,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8.r),
//                                 image: const DecorationImage(
//                                   image: AssetImage(DummyAssets.saloon),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             // Positioned(
//                             //   top: 5.h,
//                             //   right: 5.w,
//                             //   child: Container(
//                             //     width: 20.w,
//                             //     height: 20.w,
//                             //     decoration: BoxDecoration(
//                             //       color: Colors.black.withOpacity(0.24),
//                             //       shape: BoxShape.circle,
//                             //     ),
//                             //     child: Icon(Icons.close, size: 14.sp, color: AppColors.white),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
