import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../constants/assets.dart';
import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/app_divider.dart';
import '../widgets/app_items_list_view.dart';
import '../widgets/booking_summary.dart';
import '../widgets/bottom sheet/stylist_booking_request_sheet.dart';
import '../widgets/bottom sheet/stylist_rescheduling_request.dart';
import '../widgets/upcoming_agenda.dart';
import 'map_explore_page.dart';
import 'salon_page.dart';

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
    final userType = context.read<AuthViewModel>().userType;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: _buildAppBar(
            context: context,
            name: 'Sarah Mendoza',
            plan: 'Free Plan',
            user: userType,
          ),
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
                _buildUpcomingAgenda(context: context),
                SizedBox(height: MediaQuery.paddingOf(context).bottom + 30.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClientView(BuildContext context) {
    final userType = context.read<AuthViewModel>().userType;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: _buildAppBar(
            context: context,
            name: 'Sarah Mendoza',
            plan: 'Free Plan',
            user: userType,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 21.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for requests",
                      hintStyle: AppFonts.grey14w400,
                      fillColor: AppColors.white.withValues(alpha: 0.6),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: const BorderSide(color: AppColors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: const BorderSide(color: AppColors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: const BorderSide(color: AppColors.white),
                      ),
                      suffixIcon: Icon(
                        TablerIcons.filter,
                        color: AppColors.black,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text('Stylist Trending', style: AppFonts.black24w300),
                      const Spacer(),
                      InkWell(
                        onTap: () {},

                        child: Row(
                          children: [
                            Text('SEE ALL', style: AppFonts.black12w500),
                            Icon(TablerIcons.chevronRight, size: 25.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20.w : 0,
                          right: index == 3 ? 20.w : 11.w,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 13.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    DummyAssets.profile,
                                    height: 85.w,
                                    width: 85.w,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  "Chatsuda Sucha",
                                  style: AppFonts.black12w400,
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  "Hair Coloring",
                                  style: AppFonts.grey10w400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
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
                          Text(
                            'Top Rated Near You',
                            style: AppFonts.black24w300,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text('SEE ALL', style: AppFonts.black12w500),
                                Icon(TablerIcons.chevronRight, size: 25.sp),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      for (int i = 0; i < 10; i++)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: UpcomingAgenda(
                            showAsSaloon: true,
                            onTap: () => Navigator.pushNamed(
                              context,
                              SalonPage.routeName,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: MediaQuery.paddingOf(context).bottom + 30.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Container _buildClientMap() {
  //   return Container(
  //     height: 180.h,
  //     decoration: BoxDecoration(
  //       color: AppColors.white,
  //       image: const DecorationImage(
  //         image: AssetImage(DummyAssets.smallMap),
  //         fit: BoxFit.fill,
  //       ),
  //       borderRadius: BorderRadius.circular(24.r),
  //       border: Border.all(color: AppColors.white),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: .stretch,
  //       children: [
  //         const AppCurrentLocationCard(),
  //         // const Spacer(),
  //         Align(
  //           alignment: Alignment.bottomRight,
  //           child: Material(
  //             type: MaterialType.transparency,
  //             child: Padding(
  //               padding: EdgeInsets.all(16.w),
  //               child: InkWell(
  //                 onTap: () {},
  //                 borderRadius: BorderRadius.circular(15.r),
  //                 child: Ink(
  //                   width: 40.w,
  //                   height: 40.w,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(15.r),
  //                     border: Border.all(color: AppColors.lightOrange),
  //                     color: AppColors.white,
  //                   ),
  //                   child: Icon(TablerIcons.currentLocation, size: 20.sp),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Container _buildClientTopView() {
  //   return Container(
  //     padding: EdgeInsets.all(24.w),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12.r),
  //       border: Border.all(color: AppColors.white),
  //       gradient: AppColors.gradientPrimaryToPeach,
  //     ),
  //     child: Column(
  //       crossAxisAlignment: .start,
  //       children: [
  //         _buildAppBar(name: 'Olivia Bennett', plan: 'Starter Plan'),
  //         AppDivider(margin: EdgeInsets.symmetric(vertical: 24.h)),
  //         Text('Find Your Perfect Stylist', style: AppFonts.grey12w400),
  //         SizedBox(height: 14.h),
  //         AppDropdown<String>(
  //           prefixIcon: TablerIcons.cut,
  //           items: const ['Option 1', 'Option 2'],
  //           builder: (item) => Text(item),
  //           onChanged: (_) {},
  //           hint: 'Service Type',
  //         ),
  //         SizedBox(height: 14.h),
  //         AppDropdown<String>(
  //           prefixIcon: TablerIcons.mapPin,
  //           items: const ['Option 1', 'Option 2'],
  //           builder: (item) => Text(item),
  //           onChanged: (_) {},
  //           hint: 'Location',
  //         ),
  //         SizedBox(height: 14.h),
  //         AppDropdown<String>(
  //           prefixIcon: TablerIcons.calendarDue,
  //           items: const ['Option 1', 'Option 2'],
  //           builder: (item) => Text(item),
  //           onChanged: (_) {},
  //           hint: 'Schedule',
  //         ),
  //         SizedBox(height: 14.h),
  //         ElevatedButton(onPressed: () {}, child: const Text('Find a Match')),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildAppBar({
    required BuildContext context,
    required String name,
    required String plan,
    required UserType user,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.w,
          backgroundColor: AppColors.white,
          child: const Center(),
        ),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(name, style: AppFonts.black16w500),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFEE1D6),
                borderRadius: BorderRadius.circular(50.r),
                border: .all(color: AppColors.orange),
              ),
              child: Text("Free Plan", style: AppFonts.black10w400),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(TablerIcons.bell, color: AppColors.black, size: 24.sp),
        ),
        if (user == UserType.client)
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, MapExplorePage.routeName),
            icon: Icon(TablerIcons.map, color: AppColors.black, size: 24.sp),
          ),
      ],
    );
  }

  Widget _buildUpcomingAgenda({required BuildContext context}) {
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
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: UpcomingAgenda(
                status: index % 2 == 0 ? Status.confirmed : Status.pending,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.white.withValues(alpha: 0.9),
                    builder: (_) => index % 2 == 0
                        ? const StylistBookingRequestSheet(showButton: false)
                        : const StylistReschdulingRequestSheet(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
