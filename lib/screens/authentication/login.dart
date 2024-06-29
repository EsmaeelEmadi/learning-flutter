import 'package:flutter/material.dart';
import 'package:home/widgets/button/custom_button.dart';
import 'package:home/widgets/input/text_field.dart';
import 'package:home/widgets/input/password_field.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  LoginLayoutState createState() => LoginLayoutState();
}

class LoginLayoutState extends State<LoginLayout>
    with SingleTickerProviderStateMixin {
  bool _showLogin = false;
  AnimationController? _animationController;
  late Animation<double> _alpha;

  void _toggleLogin() {
    setState(() {
      _showLogin = !_showLogin;
    });
    if (_showLogin) {
      _animationController?.forward();
    } else {
      _animationController?.reverse();
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    Animation<double> curve =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut);

    _alpha = Tween(begin: 42.0, end: 500.0).animate(curve);

    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Column(
          children: [
            if (_alpha.value > 150) ...[
              const CustomTextField(label: "Username"),
              const SizedBox(height: 16),
            ],
            if (_alpha.value > 100) ...[
              const CustomPasswordField(label: "Passowrd"),
              const SizedBox(height: 16)
            ],
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Login",
                onPressed: _toggleLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
