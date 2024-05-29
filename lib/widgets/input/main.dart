import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.initialValue,
    this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          setState(() {
            _isFocused = focus;
          });
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.grey.withOpacity(_isFocused ? 0.4 : 0.2),
                        color: _isFocused
                            ? Colors.blue.withOpacity(0.3)
                            : Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 4),
                      ),
                    ]),
                child: TextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  obscureText: widget.obscureText,
                  initialValue: widget.initialValue,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.suffixIcon,
                  ),
                ),
              ),
            ),
            if (widget.labelText != null)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: _isFocused || _controller.text.isNotEmpty ? 0 : 27,
                left: _isFocused || _controller.text.isNotEmpty
                    ? 20
                    : widget.prefixIcon != null
                        ? 50
                        : 25,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _focusNode.requestFocus();
                    });
                  },
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      color: _isFocused ? Colors.blue : Colors.black87,
                      fontSize:
                          _isFocused || _controller.text.isNotEmpty ? 14 : 16,
                    ),
                    child: Container(
                      // duration: const Duration(milliseconds: 200),
                      color: Colors.white,
                      child: Text(
                        widget.labelText!,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
