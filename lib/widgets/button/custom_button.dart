import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home/routes/app_router.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color? color;
  final Color? bgColor;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.text = "",
    this.borderRadius = 5,
    this.color = Colors.white,
    this.bgColor = Colors.green,
    this.onPressed,
  });

  // style: ButtonStyle(
  //   shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(4)),
  // ),

  @override
  Widget build(BuildContext context) {

    return FilledButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Adjust the border radius as needed
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
    // return Material(
    //   borderRadius: BorderRadius.circular(borderRadius),
    //   clipBehavior: Clip.antiAlias, // Add This
    //   color: bgColor,
    //   child: MaterialButton(
    //     height: 50,
    //     onPressed: onPressed,
    //     child: Text(
    //       text,
    //       style: TextStyle(color: color),
    //     ),
    //   ),
    // );
