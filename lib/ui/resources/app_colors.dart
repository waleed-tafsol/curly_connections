import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFFF6E6FF);
  static const white = Colors.white;
  static const black = Color(0xFF0B0B0B);
  static const purple = Color(0xFFF6E6FF);
  static const peach = Color(0xFFFEE1D6);
  static const stroke = Color(0xFFF3F4F6);
  static const borderPurple = Color(0xFFA83BE6);
  static const orange = Color(0xFFFF8202);
  static final textGrey = const Color(0xFF0B0B0B).withValues(alpha: 0.5);
  static const textYellow = Color(0xFFDBA400);
  static const brown = Color(0xFF683600);
  static const fillColor = Color(0xFFFFFFFF);

  static const LinearGradient gradientPurpleToPeach = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,

    colors: [purple, peach],
  );
}
