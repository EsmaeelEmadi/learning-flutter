// import "package:flutter/material.dart";
// import 'package:home/services/authService/auth_service.dart';
//
// class RouteGuard extends AutoRedirectGuard {
//   final AuthService authService;
//   RouteGuard(this.authService) {
//     authService.addListener(() {
//       if (!authService.authenticated) {
//         reevaluate();
//       }
//     });
//   }
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//
//     if (authService.authenticated) return resolver.next();
//     // TODO: Navigate to login screen
//   }
// }
//
