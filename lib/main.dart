import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_serivce/core/utilis/appStrings.dart';
import 'package:multi_serivce/features/home/presenation/controllers/users_bloc/users_bloc.dart';
import 'package:multi_serivce/features/home/presenation/controllers/users_bloc/users_events.dart';
import 'core/service/di.dart' as di;

import 'core/error/internetCheck.dart';
import 'core/theme/theme.dart';
import 'features/home/presenation/screens/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  await NetworkInfoImpl().checkInternet();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<UsersBloc>()..add(GetUsersEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: getAppTheme(),
        home: const LayoutHome(),
      ),
    );
  }
}
