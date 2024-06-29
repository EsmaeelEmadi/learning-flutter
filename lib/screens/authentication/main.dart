import 'package:home/screens/authentication/login.dart';
import "package:flutter/material.dart";

enum LoginOrRegister { login, register, none }

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  AuthenticationScreenState createState() => AuthenticationScreenState();
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  LoginOrRegister loginOrRegister = LoginOrRegister.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          decoration: const BoxDecoration(),
          child: const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                LoginLayout()
            ],
          )),
        )));
  }
}
