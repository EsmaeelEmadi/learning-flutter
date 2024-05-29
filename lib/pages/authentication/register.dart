import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/widgets/checkbox/main.dart';
// -- widgets
import 'package:home/widgets/input/main.dart';
import 'package:home/widgets/input/password.dart';
import 'package:text_divider/text_divider.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/svg/logo.svg',
                      width: 250,
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                          Colors.blue.shade800, BlendMode.srcIn),
                    ),
                    const SizedBox(height: 40),
                    const Text("Join our Community",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    const Text("Register to use the full features"),
                    const SizedBox(height: 50),
                    const CustomTextField(
                      labelText: "Enter your Username",
                      prefixIcon: Icon(Icons.account_circle_rounded),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      labelText: "Enter your Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 10),
                    const PasswordTextField(
                      labelText: "Password",
                    ),
                    const SizedBox(height: 20),
                    CustomCheckbox(
                        value: false,
                        onChange: (bool) {},
                        child: Row(
                          children: [
                            const Text("I accept"),
                            TextButton(
                                child: const Text("Terms and Conditions"),
                                onPressed: () {})
                          ],
                        )),
                    const SizedBox(height: 40),
                    FilledButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                        ),
                        //const
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Register",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Icon(Icons.login),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const TextDivider(text: Text("or")),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('lib/assets/svg/google.svg',
                              fit: BoxFit.contain, width: 30),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('lib/assets/svg/facebook.svg',
                              fit: BoxFit.contain, width: 30),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('lib/assets/svg/twitter.svg',
                              fit: BoxFit.contain, width: 30),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Align(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don you have an account?"),
                      TextButton(
                          child: const Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            // router.push(const RegisterRoute());
                          }),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
