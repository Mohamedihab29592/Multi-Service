import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerCubit extends Cubit<int> {
  BannerCubit() : super(0);

  final PageController _pageController = PageController(initialPage: 1);
  final int _numPages = 3;

  PageController get pageController => _pageController;
  int get numPages => _numPages;

  void onPageChanged(int page) {
    emit(page);
  }
}
