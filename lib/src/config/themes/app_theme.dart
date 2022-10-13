

import 'package:flutter/material.dart';
import 'package:quotes/src/core/utils/app_colors.dart';
import 'package:quotes/src/core/utils/app_strings.dart';

ThemeData appTheme(){
  return ThemeData(
      primaryColor: AppColors.primary,
    hintColor: AppColors.hintPrimary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: AppColors.white,
    ),
    textTheme: const TextTheme(
      button: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),

  );
}