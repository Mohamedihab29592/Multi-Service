import 'package:flutter/material.dart';

import '../utilis/appColors.dart';
import '../utilis/appTextStyle.dart';


ThemeData getAppTheme() {
  return ThemeData(

    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,



    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: regularStyle(),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),

    // text field
    inputDecorationTheme: InputDecorationTheme(
      //enabled Border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightRed,
        ),
      ),

      //focused Border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightRed,
        ),
      ),

      //hint text
      hintStyle: boldStyle(color: AppColors.lightRed, fontSize: 16),

      // filled: true,
      // fillColor: AppColors.backGroundTextField,
    ),
  );
}