import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:home/layouts/authentication/main.dart';
// import 'package:home/store/application_state.dart';
// // import 'package:redux/redux.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, AppState>(
//       converter: (store) => store.state,
//       builder: (context, state) {
//         if (state.isAuthenticated.isAuthenticated) {
//           return Scaffold(
//               body: SafeArea(
//                   child: Container(child: const Center(child: Text('HomeScreen')))));
//         } else {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => const Authentication(),
//               ),
//             );
//           });
//
//           // placeholder
//           return const SizedBox();
//         }
//       },
//     );
//   }
// }

    // if (applicationState.state.isAuthenticated.isAuthenticated) {
    //   return Scaffold(
    //       body: SafeArea(
    //           child: Container(child: const Center(child: Text('hello')))));
    // } else {
    //   return Scaffold(
    //       body: SafeArea(
    //           child: Container(child: const Center(child: Text('login')))));
    // }
