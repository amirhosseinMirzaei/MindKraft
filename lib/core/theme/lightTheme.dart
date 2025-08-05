import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.backgroundLight,
    surface: AppColors.surfaceLight,
    onPrimary: Colors.white,
    onSecondary: AppColors.textLight,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textLight, fontFamily: 'Vazir'),
  ),
  fontFamily: 'Vazir',
);
