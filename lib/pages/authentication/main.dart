import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home/routes/app_router.dart';
// -- widgets
import 'package:home/widgets/appBar/auth_app_bar.dart';
import "package:home/widgets/button/custom_button.dart";

@RoutePage()
class AuthenticationMainPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthenticationMainPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar:AuthAppBar(),
        body: AutoRouter(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}


// class AuthenticationPage extends StatefulWidget {
//   const AuthenticationPage({super.key});
//
//   @override
//   State<AuthenticationPage> createState() => _AuthenticationPageState();
// }

// @RoutePage()
// class AuthenticationPage extends StatelessWidget 
//     implements AutoRouteWrapper {
//
//   const AuthenticationPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final router = AutoRouter.of(context);
//
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: IntrinsicHeight(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Expanded(
//                   child: AutoRouter(),
//                 ),
//                 if (router.currentPath == '/authentication/login' ||
//                     router.currentPath == '/authentication')
//                   CustomButton(
//                     text: "Login",
//                     onPressed: () {
//                       router.navigate(
//                         const LoginRoute(),
//                       );
//                       setState(() {
//                         _shouldRender = !_shouldRender;
//                       });
//                     },
//                   ),
//                 if (router.currentPath == '/authentication/signup' ||
//                     router.currentPath == '/authentication')
//                   CustomButton(
//                     text: "Signup",
//                     onPressed: () {
//                       router.navigate(
//                         const SignupRoute(),
//                       );
//                       setState(() {
//                         _shouldRender = !_shouldRender;
//                       });
//                     },
//                   ),
//                 if (router.currentPath == '/authentication/login')
//                   TextButton(
//                       child: const Text("back to signup"),
//                       onPressed: () {
//                         router.navigate(const SignupRoute());
//                         setState(() {
//                           _shouldRender = !_shouldRender;
//                         });
//                       }),
//                 if (router.currentPath == '/authentication/signup')
//                   TextButton(
//                       child: const Text("back to login"),
//                       onPressed: () {
//                         router.navigate(const LoginRoute());
//                         setState(() {
//                           _shouldRender = !_shouldRender;
//                         });
//                       }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return build(context);
//   }
// }
//
