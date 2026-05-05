import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
     decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.purple, AppColors.peach],
          ),
        ),
      child: Column(children: [
        Image.asset(PngAssets.splashLogo,height: 64.h,width: 95.w,),
        SizedBox(height: 32.h,),
        Row(
          children: [
            Text("Welcome Back",style: AppFonts.black22w400,),
            Text("Sign in to your Curly account",style: AppFonts.grey14w400,),
            
          ],
        )

      
          ],
        ),
    ));
  }
}
