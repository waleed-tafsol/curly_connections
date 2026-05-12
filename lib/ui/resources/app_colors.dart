import 'package:flutter/material.dart';

abstract final class AppColors {
  static final primary = const Color(0xFFFF8202).withValues(alpha: 0.4);
  static const primaryLight = Color(0xFFFEE1D6);
  static const secondary = Color(0xFFA15605);
  static const textFeildStroke = Color(0xFFE5E7EB);
  static const white = Colors.white;
  static const black = Color(0xFF0B0B0B);
  static const lightPeach = Color(0xFFFEE1D6);
  static const darkPeach = Color(0xFFF4A04A);
  static const fillpeach = Color(0xFFFEE1D6);
  static const peach = Color(0xFFFEE1D6);
  static const borderPurple = Color(0xFFD9730A);
  static const dividerColor = Color(0xFFE0E0E1);
  static const orange = Color(0xFFFF8202);
  static const lightOrange = Color(0xFFF6D2A5);
  static const lightOrange1 = Color(0xFFFDF4E9);
  static const textGrey = Color(0xFF4B5563);
  static const textYellow = Color(0xFFDBA400);
  static const brown = Color(0xFF683600);
  static const fillColor = Color(0xFFFFFFFF);
  static const greenColor = Color(0xFF008000);
  static const darkGrey = Color(0xFF36404A);
  static const mediumPurple = Color(0xFFE8C0FF);
  static const darkPurple = Color(0xFF4F378A);
  static const darkPurple1 = Color(0xFFA300FF);
  static const lightGreen = Color(0xFFB4E6DB);

  static LinearGradient gradientPurpleToPeach = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,

    colors: [
      const Color(0xFFCE9774).withValues(alpha: 0.1),

      const Color(0xFFF2EBE5),
    ],
  );

  static const LinearGradient gradientPrimaryToPeach = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.57, 1.0],
    colors: [primaryLight, darkPeach],
  );
  static LinearGradient gradientScafoldBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.21, 0.44, 0.49, 0.75],
    colors: [
      const Color(0xFFF2EBE5),
      const Color(0xFFCE9774).withValues(alpha: 0.8),
      const Color(0xFFCE9774).withValues(alpha: 0.8),
      const Color(0xFFF2EBE5),
    ],
  );
}
