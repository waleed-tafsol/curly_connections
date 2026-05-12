import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/text_form_field_with_title_widget.dart';

class ContactUsScreen extends StatelessWidget {
  static const String routeName = '/contact_us_screen';
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: 'Contact Support'),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
        alignment: Alignment.center,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: 28.h),

                  Text("Contact Information", style: AppFonts.black20w600),
                  SizedBox(height: 10.h),
                  Divider(height: 1.h, color: AppColors.dividerColor),
                  SizedBox(height: 10.h),
                  _buildContactInfo(
                    icon: TablerIcons.brandTeams,
                    title: "Customer Service",
                    value: "Opening Time (13:30 - 20:30)",
                  ),
                  SizedBox(height: 10.h),
                  _buildContactInfo(
                    icon: TablerIcons.phoneFilled,
                    title: "Phone",
                    value: "+ 27 21 785 7227",
                  ),
                  SizedBox(height: 10.h),
                  _buildContactInfo(
                    icon: TablerIcons.mailFilled,
                    title: "Email",
                    value: "info@workart.co.za",
                  ),

                  SizedBox(height: 30.h),

                  Text("I Want to be Contacted", style: AppFonts.black20w400),
                  SizedBox(height: 10.h),

                  TextFormFieldWithTitleWidget(
                    title: 'First Name',
                    hintText: "Name Here",
                    //validator: Validators.empty,
                    controller: TextEditingController(),
                  ),
                  TextFormFieldWithTitleWidget(
                    title: 'Last Name',
                    hintText: "Name Here",
                    //validator: Validators.empty,
                    controller: TextEditingController(),
                  ),
                  TextFormFieldWithTitleWidget(
                    title: 'Email',
                    hintText: "brunoandersons@example.com",
                    //  validator: Validators.email,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormFieldWithTitleWidget(
                    title: 'Phone',
                    hintText: "+1451266564",
                    //  validator: Validators.email,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Message",
                    style: AppFonts.black14w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    maxLines: 4,
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    // validator: Validators.empty,

                    // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    //   color: AppColors.blackColor,
                    // ),
                    decoration: const InputDecoration(hintText: "Message Here"),
                  ),
                  SizedBox(height: 24.h),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Submit'),
                  ),
                  SizedBox(height: MediaQuery.paddingOf(context).bottom + 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required String title,
    required String value,
    IconData? icon,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: .all(color: AppColors.dividerColor),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.black, size: 20.sp),
          ),
          SizedBox(width: 6.w),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(title, style: AppFonts.black14w600),
              SizedBox(height: 5.h),
              Text(value, style: AppFonts.grey12w400),
            ],
          ),
        ],
      ),
    );
  }
}
