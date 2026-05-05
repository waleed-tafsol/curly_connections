import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';
import '../../utils/enums.dart';
import '../resources/app_fonts.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/role_container.dart';
import 'login_screen.dart';
import 'onboarding_screen.dart';

class SelectRoleScreen extends StatelessWidget {
  static const String routeName = "/select_role";
  const SelectRoleScreen({super.key});

  String getLabel(UserType userType) {
    return switch (userType) {
      UserType.stylist => 'I’m a Stylist',
      UserType.client => 'I’m a Client',
    };
  }

  String getDescription(UserType userType) {
    return switch (userType) {
      UserType.stylist => 'I’m looking to manage my clients’ bookings.',
      UserType.client => 'I’m looking to book my appointments.',
    };
  }

  String getIcon(UserType userType) {
    return switch (userType) {
      UserType.stylist => PngAssets.scissor,
      UserType.client => PngAssets.phoneUse,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(PngAssets.selectrole),
            fit: BoxFit.fill,
            //   fit: BoxFit.contain,
          ),
        ),
        child: SafeArea(
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
                  Selector<AuthViewModel, UserType>(
                    selector: (_, vm) => vm.userType,
                    builder: (_, selectedUserType, _) {
                      return Row(
                        spacing: 10.w,
                        children: UserType.values.map((userType) {
                          return RoleContainer(
                            isSelected: selectedUserType == userType,
                            title: getLabel(userType),
                            description: getDescription(userType),
                            imagePath: getIcon(userType),
                            onTap: () {
                              context.read<AuthViewModel>().setUserType(
                                userType,
                              );
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 18.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: AppFonts.white20w500,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          LoginScreen.routeName,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          LoginScreen.routeName,
                        );
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
