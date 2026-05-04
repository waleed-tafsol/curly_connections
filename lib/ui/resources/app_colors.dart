import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFFF6E6FF);
  static const white = Colors.white;
  static const black = Colors.black;
  static const purple = Color(0xFFF6E6FF);
  static const peach = Color(0xFFFEE1D6);
  static const stroke = Color(0xFFF3F4F6);
  static const borderPurple = Color(0xFFA83BE6);

  static const LinearGradient gradientPurpleToPeach = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,

    colors: [purple, peach],
  );
}
