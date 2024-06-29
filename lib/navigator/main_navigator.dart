import 'package:flutter/material.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:redux/redux.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(store: store);

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: store.state.theme.brightness,
          ),
          useMaterial3: true,
        ),
        routerConfig: appRouter.config());
  }
}
