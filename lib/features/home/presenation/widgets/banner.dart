import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/componnets/button.dart';
import '../../../../core/utilis/appAssets.dart';
import '../../../../core/utilis/appColors.dart';
import '../../../../core/utilis/appStrings.dart';
import '../../../../core/utilis/appTextStyle.dart';

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

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerCubit(),
      child: Column(
        children: [
          Container(
            height: 170,
            color: AppColors.lightRed,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<BannerCubit, int>(
                builder: (context, currentPage) {
                  final cubit = context.read<BannerCubit>();
                  return PageView.builder(
                    controller: cubit.pageController,
                    onPageChanged: cubit.onPageChanged,
                    itemCount: cubit.numPages,
                    itemBuilder: (BuildContext context, int index) {
                      return buildBannerPage(index);
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<BannerCubit, int>(
            builder: (context, currentPage) {
              final cubit = context.read<BannerCubit>();
              return SmoothPageIndicator(
                controller: cubit.pageController,
                count: cubit.numPages,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.primary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  static Widget buildBannerPage(int index) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.multiServicesTitle,
                style: boldStyle(),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              CustomButton(onPressed: (){}, background: AppColors.primary, text: AppStrings.order, textColor: AppColors.white,),
            ],
          ),
        ),
        Image.asset(AppAssets.manPresentation),
      ],
    );
  }

}