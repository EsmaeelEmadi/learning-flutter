import "package:flutter/material.dart";

import "package:home/widgets/input/utils.dart";

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.label = "",
      this.suffix,
      this.suffixIcon,
      this.prefix,
      this.prefixIcon,
      this.borderRadius = 5,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      this.borderColor = Colors.grey,
      this.controller,
      this.obscureText = false,
      this.hintText,
      this.borderFocusColor = Colors.blue,
      this.textColor = Colors.grey
      // this.labelText,
      });

  final String label;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final MaterialColor borderColor;
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final MaterialColor borderFocusColor;
  final MaterialColor textColor;
  // final String? labelText;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> _alpha;
  final _focusNode = FocusNode();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    Animation<double> curve =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut);
    // _alpha = Tween(begin: 0.0, end: 1.0).animate(curve);
    _alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    _animationController?.addListener(() {
      setState(() {});
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _animationController?.forward();
      } else {
        _animationController?.reverse();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor.shade400),
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius),
        ),
        color: const Color.fromRGBO(239, 245, 243,1),
      ),
      child: CustomPaint(
        painter: CustomAnimationBorder(
          alpha: _alpha,
          color: widget.borderFocusColor,
          borderRadius: widget.borderRadius,
        ),
        child: TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            label: Text(
              widget.label,
              style: TextStyle(color: widget.textColor),
            ),
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            prefix: widget.prefix,
            prefixIcon: widget.prefixIcon,
            contentPadding: widget.contentPadding,
            // labelText: widget.labelText,
          ),
        ),
      ),
    );
  }
}

class CustomAnimationBorder extends CustomPainter {
  final Animation<double> alpha;
  final MaterialColor color;
  final double borderRadius;

  CustomAnimationBorder(
      {required this.alpha, required this.color, required this.borderRadius})
      : super(repaint: alpha);
  // Animation<double> offset;

  // CustomAnimationBorder(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.strokeWidth = 2;
    paint.color = color;
    paint.style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);
    path.lineTo(size.width, size.height / 2);

    var secondPath = Path();
    secondPath.moveTo(0, size.height / 2);
    secondPath.lineTo(0, size.height - borderRadius);
    secondPath.quadraticBezierTo(0, size.height, borderRadius, size.height);
    secondPath.lineTo(size.width - borderRadius, size.height);
    secondPath.quadraticBezierTo(
        size.width, size.height, size.width, size.height - borderRadius);
    secondPath.lineTo(size.width, size.height / 2);

    var p1 = Utils.createAnimatedPath(path, alpha.value);
    var p2 = Utils.createAnimatedPath(secondPath, alpha.value);

    canvas.drawPath(p1, paint);
    canvas.drawPath(p2, paint);
  }

  @override
  bool shouldRepaint(CustomAnimationBorder oldDelegate) {
    return alpha != oldDelegate.alpha;
  }
}
