import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_serivce/core/utilis/appStrings.dart';

import 'core/theme/theme.dart';
import 'features/home/presenation/screens/layout.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: getAppTheme(),
      home: const LayoutHome(),
    );
  }
}


