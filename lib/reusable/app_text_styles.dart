import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: AppFonts.bold,
    color: AppColors.black,
  );

  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: AppFonts.bold,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: AppFonts.medium,
    color: AppColors.black,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: AppFonts.regular,
    color: AppColors.black,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: AppFonts.medium,
    color: AppColors.black,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: AppFonts.regular,
    color: AppColors.grey,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: AppFonts.bold,
    color: AppColors.white,
  );

  static const TextStyle primary = TextStyle(
    fontSize: 16,
    fontWeight: AppFonts.medium,
    color: AppColors.primary,
  );
}