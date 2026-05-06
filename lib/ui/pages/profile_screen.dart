import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import 'edit_profile_screen.dart';
import 'login_screen.dart';
import 'portfolio_screen.dart';
import 'review_screen.dart';
import 'terms_conditions_screen.dart';


class ScheduleItem {
  final String service;
  final String day;
  final String startTime;
  final String endTime;

  const ScheduleItem({
    required this.service,
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}


final _schedules = [
  const ScheduleItem(service: 'Full Color Treatment', day: 'Monday', startTime: '8:30', endTime: '16:30'),
  const ScheduleItem(service: 'Full Color Treatment', day: 'Tuesday', startTime: '8:30', endTime: '16:30'),
];


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Profile', style: AppFonts.black20w400),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                    color: AppColors.black,
                    iconSize: 24.w,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.translate_rounded),
                    color: AppColors.black,
                    iconSize: 24.w,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Avatar + Info
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        border: Border.all(
                          color: const Color(0xFFF3F4F6),
                          width: 1.5,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(DummyAssets.profile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),

                    // Name + Plan + Trial
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sarah Mendoza', style: AppFonts.black16w400),
                        SizedBox(height: 4.h),

                        // Free Plan Chip
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.peach,
                            borderRadius: BorderRadius.circular(999.r),
                            border: Border.all(color: AppColors.orange),
                          ),
                          child: Text('Free Plan', style: AppFonts.black10w400),
                        ),
                        SizedBox(height: 4.h),

                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                'Trial ends in 14 days. Manage',
                                style: AppFonts.black12w400.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(Icons.arrow_forward_rounded,
                                  size: 14.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditProfileScreen.routeName);
                },
                child: Row(
                  children: [
                    Text('Edit Profile', style: AppFonts.black14w500),
                    SizedBox(width: 4.w),
                    Icon(TablerIcons.pencil, size: 18.w),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal:16.w,),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.80),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Row(
                      children: [
                         _statItem(
                          icon: TablerIcons.calendarCheck,
                          value: '42',
                          label: 'Total Bookings',
                        ),
                        _verticalDivider(),
                         _statItem(
                          icon: Icons.check_circle_outline_rounded,
                          value: '10',
                          label: 'Completed',
                        ),
                        _verticalDivider(),
                        _statItem(
                          icon: TablerIcons.calendarCancel,
                          value: '10',
                          label: 'Canceled',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),

                  _glassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Services schedule', style: AppFonts.black14w400),
                        SizedBox(height: 12.h),
                        Divider(thickness: 1.h,color: AppColors.dividerColor,),
                        SizedBox(height: 12.h),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _schedules.length,
                          separatorBuilder: (_, _) =>SizedBox(height: 20.h,child: Divider(thickness: 1.h,color: AppColors.dividerColor,),),

                          itemBuilder: (_, index) =>
                              _scheduleCard(item: _schedules[index]),
                        ),

                        SizedBox(height: 12.h),

                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.10),
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text('Update Schedule', style: AppFonts.black14w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),
                  _menuCard(
                    icon: TablerIcons.cut,
                    title: 'Portfolio',
                    subtitle: '(showcase your previous work)',
                    onTap: () {
                      Navigator.pushNamed(context, PortfolioScreen.routeName);

                    },
                  ),
                  SizedBox(height: 15.h),
                  _menuCard(
                    icon:  TablerIcons.stars,
                    title: 'Reviews & Ratings',
                    onTap: () {
                      Navigator.pushNamed(context, ReviewScreen.routeName);

                    },
                  ),
                  SizedBox(height: 15.h),
                  _menuCard(
                    icon:  TablerIcons.fileDescription,
                    title: 'Terms & Privacy Policy',
                    onTap: () {
                      Navigator.pushNamed(context, TermsConditionsScreen.routeName);

                    },
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                          (route) => false,
                    );
                  },
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.logout_rounded,
                  color: Colors.white, size: 20.w),
                  SizedBox(width: 6.w),
                  Text(
                    'Sign out',
                    style: AppFonts.black14w400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        AppColors.white,
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.white,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Delete Account',
                          style: AppFonts.black14w500.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(TablerIcons.trash, color: Colors.red, size: 20.w),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  _socialSectionWidget(),
                  SizedBox(height: 110.h),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget _glassCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: child,
    );
  }

  Widget _statItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 18.w, color: AppColors.textGrey),
                SizedBox(width: 4.w),
                Text(value, style: AppFonts.grey19w500),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppFonts.grey10w400,
            ),
          ],
        ),
      ),
    );
  }
  Widget _verticalDivider() {
    return Container(
      width: 1,
      height: 40.h,
      color: AppColors.dividerColor,
    );
  }
  Widget _scheduleCard({required ScheduleItem item}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Service + Day
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.service, style: AppFonts.black16w400),
              Text(
                item.day,
                style: AppFonts.black12w400.copyWith(
                  color: const Color(0xFF02180D),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // Time Range
          Row(
            children: [
              Text(item.startTime, style: AppFonts.black16w500),
          Icon(
                  Icons.arrow_forward_rounded,
                  size: 16.w,
                  color:AppColors.black,
                ),

              SizedBox(width: 8.w),
              SizedBox(width: 8.w),
              Text(item.endTime, style: AppFonts.black16w500),
            ],
          ),
        ],
      ),
    );
  }
  Widget _menuCard({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: _glassCard(
        child: Row(
          children: [
            Icon(icon, size: 20.w, color: AppColors.black),
            SizedBox(width: 10.w),
            Text(title, style: AppFonts.black14w400),
            if (subtitle != null) ...[
              SizedBox(width: 6.w),
              Opacity(
                opacity: 0.5,
                child: Text(subtitle, style: AppFonts.black12w400),
              ),
            ],
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              size: 20.w,
              color:AppColors.black
            ),
          ],
        ),
      ),
    );
  }
  Widget _socialSectionWidget() {
    return Column(
      children: [
        Text('Follow us', style: AppFonts.black12w400),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialIconWidget(
              icon: TablerIcons.brandTiktokFilled,
              onTap: () {},
            ),
            SizedBox(width: 24.w),
            _socialIconWidget(icon: TablerIcons.brandInstagram, onTap: () {}),
            SizedBox(width: 24.w),
            _socialIconWidget(
              icon: TablerIcons.brandFacebookFilled,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // Version
        Opacity(
          opacity: 0.5,
          child: Text(
            'Version 7.70.0\nBuild: 2508202019',
            textAlign: TextAlign.center,
            style: AppFonts.black12w400.copyWith(height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _socialIconWidget({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 24.w,
        color: AppColors.black,
        shadows: [
          Shadow(
            offset: const Offset(0, 1),
            blurRadius: 3,
            color: AppColors.black.withValues(alpha:0.25),
          ),
        ],
      ),
    );
  }
}




