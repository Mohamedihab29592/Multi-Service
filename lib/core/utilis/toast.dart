import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'appColors.dart';


void showToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 8,
      backgroundColor: chooseToastColor(state),
      textColor: AppColors.white,
      fontSize: 15);
}

enum ToastStates { success, error, }

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.success:
      color = Colors.blue;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
  }
  return color;
}