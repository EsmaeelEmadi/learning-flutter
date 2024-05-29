import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:home/widgets/checkbox/main.dart';
import 'package:home/widgets/input/main.dart';
import 'package:home/widgets/input/password.dart';
import 'package:text_divider/text_divider.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
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
                            Colors.blue.shade800,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Wellcome Back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const Text("Login to your account"),
                        const SizedBox(height: 50),
                        const CustomTextField(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.account_circle_rounded),
                        ),
                        const SizedBox(height: 10),
                        const PasswordTextField(
                          labelText: "Password",
                        ),
                        const SizedBox(height: 20),
                        CustomCheckbox(
                          value: true,
                          onChange: (bool) {},
                          child: const Text("Remember me?"),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            TextButton(
                                child: const Text("Forgot Password?"),
                                onPressed: () {}),
                          ],
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                              ),
                              //const
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Login",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 10),
                                Icon(Icons.login),
                              ],
                            )),
                        const SizedBox(height: 30),
                        const TextDivider(text: Text("or")),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'lib/assets/svg/google.svg',
                                  fit: BoxFit.contain,
                                  width: 30),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'lib/assets/svg/facebook.svg',
                                  fit: BoxFit.contain,
                                  width: 30),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'lib/assets/svg/twitter.svg',
                                  fit: BoxFit.contain,
                                  width: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                router.push(const RegisterRoute());
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
