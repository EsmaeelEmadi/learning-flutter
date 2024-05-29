import 'package:home/screens/authentication/login.dart';
// import 'package:home/widgets/button/custom_button.dart';
// import 'package:home/widgets/button/custom_text_button.dart';
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

    // if (loginOrRegister == LoginOrRegister.none) {
    //   return Scaffold(
    //       backgroundColor: Colors.white,
    //       body: SafeArea(
    //           child: Container(
    //         decoration: const BoxDecoration(),
    //         child: Center(
    //             child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             const SizedBox(
    //               height: 50,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 25),
    //               child: Text(
    //                 "Wellcome",
    //                 style: TextStyle(
    //                   color: Colors.grey.shade700,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 10,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 25),
    //               child: Text(
    //                 "Some random greeting text for users, who care what this text says!",
    //                 style: TextStyle(
    //                   color: Colors.grey.shade700,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 25,
    //             ),
    //             const LoginLayout(),
    //             const SizedBox(
    //               height: 5,
    //             ),
    //             Container(
    //                 width: double.infinity, // Make the container full width
    //                 padding: const EdgeInsets.symmetric(
    //                     horizontal: 25), // Set padding as needed
    //                 child: const CustomTextButton(text: "Register")),
    //           ],
    //         )),
    //       )));
    // } else if (loginOrRegister == LoginOrRegister.login) {
    //   return Scaffold(
    //       backgroundColor: Colors.white,
    //       body: SafeArea(
    //           child: Container(
    //         decoration: const BoxDecoration(),
    //         child: Center(
    //             child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             const SizedBox(
    //               height: 50,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 25),
    //               child: Text(
    //                 "Login",
    //                 style: TextStyle(
    //                   color: Colors.grey.shade700,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ),
    //             Container(
    //                 width: double.infinity, // Make the container full width
    //                 padding: const EdgeInsets.symmetric(
    //                     horizontal: 25), // Set padding as needed
    //                 child: CustomTextButton(
    //                   text: "Register",
    //                   onPressed: () {
    //                     setState(() {
    //                       loginOrRegister = LoginOrRegister.register;
    //                     });
    //                   },
    //                 )),
    //           ],
    //         )),
    //       )));
    // } else {
    //   return Scaffold(
    //       backgroundColor: Colors.white,
    //       body: SafeArea(
    //           child: Container(
    //         decoration: const BoxDecoration(),
    //         child: Center(
    //             child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             const SizedBox(
    //               height: 50,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 25),
    //               child: Text(
    //                 "Register",
    //                 style: TextStyle(
    //                   color: Colors.grey.shade700,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         )),
    //       )));
