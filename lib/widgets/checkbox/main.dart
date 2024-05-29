import "package:flutter/material.dart";

class CustomCheckbox extends StatelessWidget {
  final Widget? child;
  final ValueChanged<bool?>? onChange;
  final bool value;

  const CustomCheckbox(
      {super.key, this.child, this.onChange, this.value = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, activeColor: Colors.greenAccent, onChanged: onChange),
        if (child != null) child!
      ],
    );
  }
}
