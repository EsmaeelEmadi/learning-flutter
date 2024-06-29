import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:home/widgets/checkbox/main.dart';
import 'package:home/widgets/dialog/terms_of_condition.dart';
// -- widgets
import 'package:text_divider/text_divider.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isTermOfConditionAccepted = false;
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: state.theme.brightness == Brightness.light
                      ? Colors.white
                      : Colors.grey.shade900),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
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
                            const SizedBox(height: 30),
                            const Text("Join our Community",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                            const Text("Register to use the full features"),
                            const SizedBox(height: 20),
                            TextFormField(
                              // controller: usernameController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_rounded),
                                hintText: 'Enter Username',
                                labelText: 'Username',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please fill the Username';
                                } else if (value.length < 5) {
                                  return 'Username should have more than 5 characters';
                                } else if (value.length > 12) {
                                  return 'Username should have less than 12 characters';
                                }
            
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              // controller: usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Enter your Email',
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please fill the Email';
                                } else if (value.length < 5) {
                                  return 'Email should have more than 5 characters';
                                } else if (value.length > 12) {
                                  return 'Email should have less than 12 characters';
                                }
            
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              // controller: passwordController,
                              obscureText: _isObscured,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                ),
                                hintText: 'Enter Password',
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please fill the Password';
                                } else if (value.length < 5) {
                                  return 'Password should have more than 5 characters';
                                } else if (value.length > 12) {
                                  return 'Password should have less than 12 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomCheckbox(
                              value: _isTermOfConditionAccepted,
                              onChange: (v) {
                                setState(() {
                                  _isTermOfConditionAccepted = v!;
                                });
                              },
                              child: Row(
                                children: [
                                  const Text("I accept"),
                                  TextButton(
                                    child: const Text("Terms and Conditions"),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const TermOfConditionDialogBuilder();
                                          });
                                    },
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(height: 40),
                            FilledButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 20),
                                ),
                                //const
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              onPressed:
                                  !_isTermOfConditionAccepted ? null : () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Register",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Icon(Icons.login),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      router.push(LoginRoute());
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
