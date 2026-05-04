import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';

import '../widgets/role_container.dart';

class ChipScreen extends StatelessWidget {
  static const String routeName = "/chip_screen";
  const ChipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chip Screen")),
      body: Column(
        children: [
          Center(
            child: Row(
              children: [
                const RoleContainer(
                  description: "I’m looking to manage my clients’ bookings.",
                  imagePath: PngAssets.scissor,
                  title: "I’m a Stylist",
                  isSelected: true,
                ),
                SizedBox(width: 20.w),
                const RoleContainer(
                  description: "I’m looking to manage my clients’ bookings.",
                  imagePath: PngAssets.scissor,
                  title: "I’m a Stylist",
                  isSelected: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
