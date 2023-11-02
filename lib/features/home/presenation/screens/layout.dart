import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_serivce/core/utilis/appAssets.dart';
import 'package:multi_serivce/core/utilis/appColors.dart';

import '../../../../core/utilis/appStrings.dart';
import '../controllers/navBarCubit/cubit.dart';





class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LayoutHomeCubit(),
      child: BlocBuilder<LayoutHomeCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: IndexedStack(
                  index: currentIndex,
                  children: LayoutHomeCubit().screens,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.grey,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (int index) {
                context.read<LayoutHomeCubit>().changeScreen(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: currentIndex == 0
                      ? Image.asset(
                    AppAssets.home,
                    color: AppColors.primary,
                  )
                      : Image.asset(
                    AppAssets.home,
                    color: AppColors.grey,
                  ),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 1
                      ? Image.asset(
                    AppAssets.assets,
                    color: AppColors.primary,
                  )
                      : Image.asset(
                    AppAssets.assets,
                    color: AppColors.grey,
                  ),
                  label: AppStrings.assets,
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 2
                      ? Image.asset(
                    AppAssets.supportAgent,
                    color: AppColors.primary,
                  )
                      : Image.asset(
                    AppAssets.supportAgent,
                    color: AppColors.grey,
                  ),
                  label: AppStrings.support,
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 3
                      ? Image.asset(
                    AppAssets.person,
                    color: AppColors.primary,
                  )
                      : Image.asset(
                    AppAssets.person,
                    color: AppColors.grey,
                  ),
                  label: AppStrings.profile,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}