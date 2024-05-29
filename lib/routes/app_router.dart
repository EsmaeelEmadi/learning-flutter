import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

import "package:home/pages/root/root_page.dart";

// -- Home
import "package:home/pages/home/home_page.dart";

// -- Authentication
import "package:home/pages/authentication/main.dart";
import "package:home/pages/authentication/authentication.dart";
import "package:home/pages/authentication/register.dart";

// -- profile
import "package:home/pages/profile/profile.dart";

// -- about us
import "package:home/pages/about_us/about_us.dart";

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
        child: child,
      ),
    );
  }
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: AuthenticationMainRoute.page,
          path: '/authentication',
          transitionsBuilder: TransitionsBuilders.slideRight,
          durationInMilliseconds: 300,
          children: [
            AutoRoute(path: "main", page: AuthenticationRoute.page, initial: true),
            AutoRoute(
              page: RegisterRoute.page,
              path: "register",
              // transitionsBuilder: CustomPageTransitions.slideLeftWithFade,
              // durationInMilliseconds: 300,
            ),
          ],
        ),
        AutoRoute(
          page: RootWrapperRoute.page,
          path: "/",
          children: [
            AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
            AutoRoute(page: ProfileRoute.page, path: 'profile'),
            AutoRoute(page: AboutUsRoute.page, path: 'about')
          ],
        ),
      ];
}
