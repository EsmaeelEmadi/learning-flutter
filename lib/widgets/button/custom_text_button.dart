import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final MaterialColor color;
  final double borderRadius;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    this.text = "",
    this.color = Colors.green,
    this.borderRadius = 10.0, // Default border radius
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          overlayColor:
              MaterialStateProperty.all<Color>(color.shade50.withOpacity(0.4)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color, // Change text color if needed
            fontWeight: FontWeight.bold, // Adjust font weight if needed
          ),
        ),
      ),
    );
  }
}
