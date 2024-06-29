import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";

import "package:home/pages/root/root_page.dart";

// -- Home
import "package:home/pages/home/home_page.dart";

// -- Search
import "package:home/pages/search/search_page.dart";

// -- Authentication
import "package:home/pages/authentication/main.dart";
import "package:home/pages/authentication/login.dart";
import "package:home/pages/authentication/register.dart";

// -- profile
import "package:home/pages/profile/profile.dart";

// -- about us
import "package:home/pages/about_us/about_us.dart";
// import "package:home/routes/auth_guard.dart";
import "package:home/store/application_state.dart";
import "package:redux/redux.dart";

part 'app_router.gr.dart';

class CustomPageTransitions {
  static Widget slideLeftWithFade(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: const Text("hello"),
      ),
    );
  }
}

class CheckIfUser extends AutoRouteGuard {
  // final Store<AppState> store;

  // CheckIfUser(this.store);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    const bool isAuthenticated = false;
    // store.state.user.isAuthenticated;
    if (!isAuthenticated && resolver.route.name == ProfileRoute.name) {
      router.push(LoginRoute(onResult: (didLogin) => resolver.next(didLogin)));
    } else {
      resolver.next(true); // book was found. proceed to the page
    }
  }
}

// @override
// void onNavigation(NavigationResolver resolver, router) async {
//   final bool isAuthenticated = store.state.user.isAuthenticated;

//   if (!isAuthenticated && resolver.route.name == ProfileRoute.name) {
//     router.push(
//         AuthenticationRoute(onResult: (didLogin) => resolver.next(didLogin)));
//     // resolver.redirect(
//     //     AuthenticationRoute(onResult: (didLogin) => resolver.next(didLogin)));
//   } else {
//     resolver.next(true);
//   }
// }

//implements AutoRouteGuard
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  final Store<AppState> store;

  AppRouter({required this.store});

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: AuthenticationMainRoute.page,
          path: '/authentication',
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          children: [
            CustomRoute(
              path: "login",
              page: LoginRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: RegisterRoute.page,
              path: "register",
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
          ],
        ),
        AutoRoute(
          page: RootWrapperRoute.page,
          path: "/",
          children: [
            AutoRoute(
              page: MainRoute.page,
              path: 'home',
              initial: true,
            ),
            AutoRoute(
              page: SearchRoute.page,
              path: 'search',
            ),
            AutoRoute(
              // guards: [CheckIfUser()],
              page: ProfileRoute.page,
              path: 'profile',
            ),
            AutoRoute(
              page: AboutUsRoute.page,
              path: 'about',
            )
          ],
        ),
      ];
}
