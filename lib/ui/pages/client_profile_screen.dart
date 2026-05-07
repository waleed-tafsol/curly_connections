import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import 'change_password_screen.dart';
import 'contact_us_screen.dart';
import 'edit_profile_screen.dart';
import 'select_role_screen.dart';
import 'terms_conditions_screen.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _profileDetailCard(
                    onEditTap: () {
                      Navigator.pushNamed(context, EditProfileScreen.routeName);
                    },
                  ),
                  SizedBox(height: 9.h),
                  Row(
                    children: [
                      Expanded(
                        child: _statCardWidget(
                          label: 'Total Booking',
                          value: '28',
                          subtitle: 'Total Number Of Booking',
                          color: const Color(0xFFEFD4FF),
                          borderColor: const Color(0x33A300FF),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: _statCardWidget(
                          label: 'Upcoming Booking',
                          value: '3',
                          subtitle: 'Your scheduled bookings',
                          color: const Color(0xFFFDF4E9),
                          borderColor: const Color(0x68EE8E1F),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  _menuCard(
                    icon: TablerIcons.fileDescription,
                    title: 'Terms & Privacy Policy',
                    onTap: () => Navigator.pushNamed(
                      context,
                      TermsConditionsScreen.routeName,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  _menuCard(
                    icon: TablerIcons.lock,
                    title: 'Update Password',
                    onTap: () => Navigator.pushNamed(
                      context,
                      ChangePasswordScreen.routeName,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  _menuCard(
                    icon: TablerIcons.headset,
                    title: 'Contact Support',
                    onTap: () {
                        Navigator.pushNamed(context, ContactUsScreen.routeName);
                    }

                  ),

                  SizedBox(height: 15.h),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SelectRoleScreen.routeName,
                        (route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 20.w,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Sign out',
                          style: AppFonts.black14w400.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SelectRoleScreen.routeName,
                            (route) => false,
                      );
                    },
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
        color: Colors.white.withValues(alpha:0.80),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: child,
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
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileDetailCard({required VoidCallback onEditTap}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          center: Alignment(0.0, 0.29),
          radius: 1.86,
          colors: [Color(0xFFFEE1D6), Color(0xFFF6E5FD)],
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROFILE DETAIL',
            style: AppFonts.grey10w400.copyWith(letterSpacing: 2),
          ),
          SizedBox(height: 10.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.dividerColor, width: 1.5),
                  image: const DecorationImage(
                    image: AssetImage(DummyAssets.profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olivia Bennett', style: AppFonts.black16w400),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.peach,
                        borderRadius: BorderRadius.circular(999.r),
                        border: Border.all(color: AppColors.orange),
                      ),
                      child: Text('Starter Plan', style: AppFonts.black10w400),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: onEditTap,
                child: Row(
                  children: [
                    Text('Edit Profile', style: AppFonts.black14w500),
                    SizedBox(width: 4.w),
                    Icon(TablerIcons.pencil, size: 18.sp),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha:0.5),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 33.w,
                  height: 33.w,
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(0.0, 0.29),
                      radius: 1.86,
                      colors: [Color(0xFFFEE1D6), Color(0xFFF6E5FD)],
                    ),
                    borderRadius: BorderRadius.circular(79.r),
                  ),
                  child: Icon(
                    TablerIcons.crown,
                    size: 16.w,
                    color: AppColors.orange,
                  ),
                ),
                SizedBox(width: 8.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subscription',
                        style: AppFonts.grey12w400.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text('Starter', style: AppFonts.black14w400),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 32.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha:0.66),
                      borderRadius: BorderRadius.circular(52.r),
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha:0.10),
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text('Upgrade', style: AppFonts.black14w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCardWidget({
    required String label,
    required String value,
    required String subtitle,
    required Color color,
    required Color borderColor,
  }) {
    return Container(
      height: 124.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppFonts.black12w400),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppFonts.black16w400.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 4.h),
              Opacity(
                opacity: 0.5,
                child: Text(subtitle, style: AppFonts.black12w400),
              ),
            ],
          ),
        ],
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
