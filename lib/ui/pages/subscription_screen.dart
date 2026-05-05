import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../widgets/custom_appbar_back_button.dart';

class SubscriptionScreen extends StatefulWidget {
  static const String routeName = '/subscription';
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBarBackButton(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientScafoldBackground,
        ),
      ),
    );
  }
}
