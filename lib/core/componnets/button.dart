import 'package:flutter/material.dart';
import 'package:multi_serivce/core/utilis/appTextStyle.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 40,
    this.width = 128,
    required this.onPressed,
    required this.background,
    required this.textColor,
    required this.text,
  });

  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final Color? textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: onPressed,
      child:  Container(

        height: height!,
        width: width!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: background,

        ),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                 RoundedRectangleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: background!,
                      width: 1), // <-- this doesn't work?
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                )),
            backgroundColor: MaterialStateProperty.all(background!),
          ),
          child: Text(
            text,
            style: regularStyle(color: textColor!,),
          ),
        ),
      ),
    );
  }
}