import "package:flutter/material.dart";

class CustomCheckbox extends StatelessWidget {
  final Widget? child;
  final ValueChanged<bool?>? onChange;
  final bool value;
  final bool readOnly;

  const CustomCheckbox({
    super.key,
    this.child,
    this.onChange,
    this.value = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: value,
            activeColor: Colors.green,
            onChanged: readOnly ? null : onChange),
        if (child != null) child!
      ],
    );
  }
}
