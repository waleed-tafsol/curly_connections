import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../resources/app_fonts.dart';
import '../widgets/role_container.dart';
import 'login_screen.dart';

class SelectRoleScreen extends StatelessWidget {
  static const String routeName = "/select_role";
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PngAssets.selectrole),
              fit: BoxFit.fill,
              //   fit: BoxFit.contain,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  SizedBox(height: 21.h),
                  Image.asset(PngAssets.splashLogo, height: 64.h, width: 95.w),
                  SizedBox(height: 30.h),
                  Text(
                    "How curly can help you?",
                    style: AppFonts.black22w400,
                    textAlign: .center,
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      "Kindly select the purpose you are using this app to get the best of it’s experience",
                      style: AppFonts.black14w400,
                      textAlign: .center,
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Row(
                    children: [
                      const RoleContainer(
                        isSelected: true,
                        title: 'I’m a Stylist',
                        description:
                            'I’m looking to manage my clients’ bookings.',
                        imagePath: PngAssets.scissor,
                      ),
                      SizedBox(width: 10.w),
                      const RoleContainer(
                        isSelected: true,
                        title: 'I’m a Client',
                        description: 'I’m looking to book my appointments.',
                        imagePath: PngAssets.phoneUse,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 18.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: AppFonts.white20w500,
                      ),
                      onPressed: () {
                         Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                      child: const Text("Get Started"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
