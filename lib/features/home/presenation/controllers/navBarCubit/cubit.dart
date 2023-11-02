import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/ProfileScreen.dart';
import '../../screens/assetsScreen.dart';
import '../../screens/homeScreen.dart';
import '../../screens/supportScreen.dart';

class LayoutHomeCubit extends Cubit<int> {
  LayoutHomeCubit() : super(0);

  final List<Widget> screens = [
    const HomeScreen(),
    const AssetsScreen(),
    const SupportScreen(),
    const ProfileScreen(),
  ];

  void changeScreen(int index) {
    emit(index);
  }
}