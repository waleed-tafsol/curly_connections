import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/text_form_field_with_title_widget.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = '/edit_profile_screen';

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Edit Profile',
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text("Edit Profile", style: AppFonts.black22w400),
                SizedBox(height: 25.h,),
                Text("Profile Picture", style: AppFonts.black14w400),
                SizedBox(height: 10.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.dividerColor,
                        width: 1,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(DummyAssets.profile), // Use your profile image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.w,
                    right: 0.w,
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.dividerColor,
                            width: 1.w,
                          ),
                        ),
                        child: Icon(
                          TablerIcons.pencil,
                          size: 18.sp, // Edit icon size
                          color: AppColors.black, // Icon color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                SizedBox(height: 15.h),
                TextFormFieldWithTitleWidget(
                  title: 'Name',
                  controller: TextEditingController(text: "Olivia Bennett"),
                ),
                SizedBox(height: 15.h),
                TextFormFieldWithTitleWidget(
                  title: 'Email',
                  controller: TextEditingController(text: "olivia_bennett@gmail.com"),
                ),
                SizedBox(height: 15.h),
                TextFormFieldWithTitleWidget(
                  title: 'Location',
                  controller: TextEditingController(text: "United States"),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                  label: const Text("Save Changes"),
                  icon: Icon(TablerIcons.arrowRight, size: 16.sp),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
