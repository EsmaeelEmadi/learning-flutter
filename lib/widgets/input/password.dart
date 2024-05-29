import "package:flutter/material.dart";
import "package:home/widgets/input/main.dart";

class PasswordTextField extends StatefulWidget {
  final String? labelText;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final String? initialValue;
  final bool obscureText;
  final TextEditingController? controller;

  const PasswordTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.initialValue,
    this.controller,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: widget.labelText,
      obscureText: _isObscured,
      suffixIcon: IconButton(
        icon: Icon(
          _isObscured ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
      ),
      prefixIcon: const Icon(Icons.lock),
      initialValue: widget.initialValue,
      controller: widget.controller,
    );
  }
}
