import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_serivce/features/home/presenation/widgets/serviceWidget.dart';



import '../../../../core/componnets/button.dart';
import '../../../../core/utilis/appColors.dart';
import '../../../../core/utilis/appStrings.dart';
import '../controllers/mainButtonscubit/cubit.dart';
import 'categoriesWidget.dart';
import 'orderWidget.dart';



class ViewWidgets extends StatelessWidget {
  const ViewWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          context.read<NavigationCubit>().selectButton(0);
                        },
                        textColor:context
                            .watch<NavigationCubit>()
                            .state ==
                            0
                            ? AppColors.white
                            : AppColors.black,
                        text: AppStrings.categories,
                        background: context
                            .watch<NavigationCubit>()
                            .state ==
                            0
                            ? AppColors.primary
                            : AppColors.lightGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomButton(
                        textColor:context
                            .watch<NavigationCubit>()
                            .state ==
                            1
                            ? AppColors.white
                            : AppColors.black,
                        onPressed: () {
                          context.read<NavigationCubit>().selectButton(1);
                        },
                        text: AppStrings.services,
                        background: context
                            .watch<NavigationCubit>()
                            .state ==
                            1
                            ? AppColors.primary
                            : AppColors.lightGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomButton(
                        textColor:context
                            .watch<NavigationCubit>()
                            .state ==
                            2
                            ? AppColors.white
                            : AppColors.black,
                        onPressed: () {
                          context.read<NavigationCubit>().selectButton(2);
                        },
                        text: "${AppStrings.order}(0)",
                        background: context
                            .watch<NavigationCubit>()
                            .state ==
                            2
                            ? AppColors.primary
                            : AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<NavigationCubit, int>(
              builder: (context, selectedIndex) {
                switch (selectedIndex) {
                  case 0:
                    return const CategoriesWidget();
                  case 1:
                    return const ServiceWidget();
                  case 2:
                    return const OrderWidget();
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),


      ),
    );
  }
}