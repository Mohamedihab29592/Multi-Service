import 'package:flutter/material.dart';

import '../../../../core/utilis/appAssets.dart';
import '../../../../core/utilis/appColors.dart';
import '../../../../core/utilis/appStrings.dart';
import '../../../../core/utilis/appTextStyle.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      ListView.separated(
        padding: const EdgeInsets.all(15),
        physics: const NeverScrollableScrollPhysics(),

          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(index.toString(),style: boldStyle(),),
                const SizedBox(width: 10,),
                Text("user",style: boldStyle(),),
                const Spacer(),
                Image.asset(AppAssets.rightArrow),
              ],);
          },
          separatorBuilder: (context, index) =>  Divider(color: Colors.grey.shade200,),
          itemCount: 10)
    ],);
  }
}
