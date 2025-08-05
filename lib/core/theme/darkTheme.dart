import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.backgroundDark,
    surface: AppColors.surfaceDark,
    onPrimary: Colors.white,
    onSecondary: AppColors.textDark,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textDark,),
  ),
  // fontFamily: 'Vazir',
);
