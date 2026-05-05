import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFFF6E6FF);
  static const primaryLight = Color(0xFFFCF0FC);
  static const secondary = Color(0xFFA15605);
  static const white = Colors.white;
  static const black = Color(0xFF0B0B0B);
  static const purple = Color(0xFFF6E6FF);
  static const lightPurple = Color(0xFFF6E5FD);
  static const peach = Color(0xFFFEE1D6);
  static const pink = Color(0xFFEAC3FF);
  static const borderPurple = Color(0xFFA83BE6);
  static const orange = Color(0xFFFF8202);
  static final textGrey = const Color(0xFF0B0B0B).withValues(alpha: 0.5);
  static const textYellow = Color(0xFFDBA400);
  static const brown = Color(0xFF683600);
  static const fillColor = Color(0xFFFFFFFF);
  static const greenColor = Color(0xFF008000);
  static const darkGrey = Color(0xFF36404A);

  static const LinearGradient gradientPurpleToPeach = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,

    colors: [purple, peach],
  );

  static const LinearGradient gradientPeachToPurple = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.57, 1.0],
    colors: [peach, lightPurple],
  );
}
