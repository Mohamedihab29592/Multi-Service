import 'package:flutter/material.dart';
import 'package:multi_serivce/core/utilis/appAssets.dart';
import 'package:multi_serivce/core/utilis/appTextStyle.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,});
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(AppAssets.menu),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: boldStyle(),
            ),
          ),
        ),
      ],
    );
  }
}
