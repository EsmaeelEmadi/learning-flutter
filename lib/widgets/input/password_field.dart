import "package:flutter/material.dart";
import "package:home/widgets/input/text_field.dart";

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.label = "",
    this.hintText,
    this.controller,
  });

  // @override
  final String label;
  final String? hintText;
  final TextEditingController? controller;

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      obscureText: _obscureText,
    );
  }
}
