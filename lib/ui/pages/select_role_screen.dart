import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';

class SelectRoleScreen extends StatelessWidget {
   static const String routeName = "/select_role";
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: 
        AssetImage(PngAssets.selectrole,),fit: BoxFit.cover)),
         
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Image.asset(PngAssets.splashLogo,height: 64.h,)
          ],
        ),
      ),
    );
  }
}