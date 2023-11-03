import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_serivce/features/home/presenation/controllers/users_bloc/users_bloc.dart';
import 'package:multi_serivce/features/home/presenation/controllers/users_bloc/users_states.dart';

import '../../../../core/utilis/appAssets.dart';
import '../../../../core/utilis/appColors.dart';
import '../../../../core/utilis/appStrings.dart';
import '../../../../core/utilis/appTextStyle.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.categoriesView,
              style: regularStyle(fontSize: 14, color: AppColors.grey),
            ),
            Text(
              AppStrings.seeAll,
              style: regularStyle(fontSize: 14, color: AppColors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
           if (state is UsersLoading) {
          return const Center(child: CircularProgressIndicator.adaptive(),) ;

          }
          else if (state is UsersLoaded) {
            return ListView.separated(
                padding: const EdgeInsets.all(15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                       state.userdata[index].id.toString(),
                        style: boldStyle(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        state.userdata[index].name,
                        style: boldStyle(),
                      ),
                      const Spacer(),
                      Image.asset(AppAssets.rightArrow),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade200,
                    ),
                itemCount: 10);
          } else if (state is UsersError) {
             Center(child: Text(state.message));

          }
           return const SizedBox();


        }),
      ],
    );
  }
}
