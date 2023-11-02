import 'package:flutter/material.dart';
import 'package:multi_serivce/core/utilis/appTextStyle.dart';

import '../../../../core/utilis/appAssets.dart';
import '../../../../core/utilis/appStrings.dart';

class HeadLineWidget extends StatelessWidget {
  const HeadLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Row(children: [
            Image.asset(AppAssets.pp,),
            Text(AppStrings.heyAhmed,style: regularStyle(),),
            Image.asset(AppAssets.hands),


          ],),
          const SizedBox(height: 20,),
          Text(AppStrings.multiServicesTitle,style: boldStyle(),),
          const SizedBox(height: 5,),

          Text(AppStrings.description,style:longLineStyle() ,),
        ],),
      ),
    );
  }
}
