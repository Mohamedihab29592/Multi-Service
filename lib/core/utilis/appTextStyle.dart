import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appColors.dart';


TextStyle _textStyle({
  required TextDecoration textDeco,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.outfit(
    color: color,
    decoration: textDeco,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

// bold style
TextStyle boldStyle({
  Color color = AppColors.black,
  double fontSize = 20,
}) =>
    _textStyle(
      textDeco: TextDecoration.none,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );

// regular style
TextStyle regularStyle({
  Color color = AppColors.black,
  double fontSize = 16,
}) =>
    _textStyle(
      textDeco: TextDecoration.none,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );

//underline style
TextStyle longLineStyle({
  TextDecoration textDeco = TextDecoration.none,
  Color color = AppColors.grey,
  double fontSize = 16,
}) =>
    _textStyle(
      textDeco: textDeco,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );