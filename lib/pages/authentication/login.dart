import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/api/client.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:home/store/auth/action.dart';
import 'package:home/utils/storage.dart';
import 'package:home/widgets/checkbox/main.dart';
import 'package:text_divider/text_divider.dart';

String usernameValidator(value) {
  if (!value.length) {
    return "Enter your username";
  }

  return "";
}

@RoutePage()
class LoginPage extends StatefulWidget {
  final void Function(dynamic)? onResult;

  const LoginPage({this.onResult, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _isObscured = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        final store = StoreProvider.of<AppState>(context);

        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: state.theme.brightness == Brightness.light
                    ? Colors.white
                    : Colors.grey.shade900),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
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
                              fontSize: 24,
                            ),
                          ),
                          const Text("Login to your account"),
                          const SizedBox(height: 20),
                          TextFormField(
                            readOnly: state.auth.isLoading,
                            controller: usernameController,
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
                          TextFormField(
                            readOnly: state.auth.isLoading,
                            controller: passwordController,
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
                            readOnly: state.auth.isLoading,
                            value: _rememberMe,
                            onChange: (v) {
                              setState(() {
                                _rememberMe = v!;
                              });
                            },
                            child: const Text("Remember me?"),
                          ),
                          // const SizedBox(height: 20),
                          Row(
                            children: [
                              TextButton(
                                  child: const Text("Forgot Password?"),
                                  onPressed: () {}),
                            ],
                          ),
                          // const SizedBox(height: 20),
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
                              onPressed: state.auth.isLoading
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {
                                        store.dispatch(SetLoginIsLoading(true));

                                        if (!context.mounted) return;
                                        final client = DioClient();
                                        // final api = AuthApi(client: client);
                                        try {
                                          final response = await client
                                              .login("auth/login", data: {
                                            "username": usernameController.text,
                                            "password": passwordController.text,
                                          });

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                "Login Succesful",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          );
                                          store.dispatch(
                                              SetLoginIsAuthenticated(true));

                                          store
                                              .dispatch(SetLoginData(response));
                                          await TokenStorage.saveTokens(
                                            response.accessToken?.accessToken,
                                            response.accessToken?.expiresIn,
                                            response.refreshToken?.refreshToken,
                                            response
                                                .refreshToken?.refreshExpiresIn,
                                            response.issuedAt,
                                          );

                                          router.replaceAll([RootWrapperRoute()]);
                                        } on DioException catch (e) {
                                          final errorData = e.response?.data
                                              as Map<String, dynamic>;

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                "${e.response?.statusCode}: ${errorData['error']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          );
                                        } finally {
                                          store.dispatch(
                                              SetLoginIsLoading(false));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "Form Has Errors, Fix errors and retry",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state.auth.isLoading)
                                    const Center(
                                        child: SizedBox(
                                            width: 24,
                                            height: 24,
                                            child:
                                                CircularProgressIndicator())),
                                  if (!state.auth.isLoading) ...[
                                    const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.login),
                                  ]
                                ],
                              )),
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
                                onPressed: () {
                                  if (widget.onResult != null) {
                                    widget.onResult;
                                  }
                                },
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
              ),
            ),
          ),
        );
      },
    );
  }
}
