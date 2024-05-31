import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/widgets/appBar/main_app_bar.dart';
import 'package:home/widgets/menu/main_menu.dart';

@RoutePage()
class RootWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const RootWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: MainAppBar(),
        endDrawer: MainMenu(),
        body: AutoRouter(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}


        