import "package:flutter/material.dart";

class CustomChip extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const CustomChip({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: Colors.grey,
            width: 0,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.grey)),
    );
  }
}

