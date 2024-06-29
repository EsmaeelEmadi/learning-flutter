import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home/widgets/appBar/main_app_bar.dart';
import 'package:home/widgets/menu/main_menu.dart';

@RoutePage()
class RootWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  RootWrapperPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget wrappedRoute(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // Assign the key to Scaffold
        appBar: MainAppBar(scaffoldKey: _scaffoldKey),
        endDrawer: const MainMenu(),
        body: const AutoRouter(),
        resizeToAvoidBottomInset: true, // Automatically adjust for keyboard
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
