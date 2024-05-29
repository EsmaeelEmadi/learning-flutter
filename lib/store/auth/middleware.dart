// import "package:flutter/material.dart";
// import "package:home/navigator/routes.dart";
// import "package:home/store/application_state.dart";
// import "package:redux/redux.dart";
// // models
// import "package:home/models/app/route.dart" as app_;
//
// class NavigateAction {
//   final String routeName;
//   final BuildContext context;
//
//   NavigateAction(this.routeName, this.context);
// }
//
// void authenticationMiddleware(
//     Store<AppState> store, dynamic action, NextDispatcher next) {
//   if (action is NavigateAction) {
//     final Route? route = Routes.getRoute(action.routeName);
//
//
//     Navigator.of(action.context).pushNamed(action.routeName);
//     // if (action.route.withAuth == true) {
//     //   if (!store.state.isAuthenticated.isAuthenticated) {
//     //     Navigator.of(action.context).pushNamed(Routes.authenticationRoute.name);
//     //     return;
//       // }
//     // }
//   }
//   next(action); // Allow navigation to proceed
// }
