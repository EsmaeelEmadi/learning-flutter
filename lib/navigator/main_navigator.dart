import 'package:flutter/material.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:redux/redux.dart';
// import 'package:home/screens/NotFound/main.dart';
// import 'package:home/navigator/routes.dart';
// import 'package:home/screens/authentication/main.dart';
// import 'package:home/screens/home/main.dart';

class MainNavigator extends StatelessWidget {
  MainNavigator({super.key, required this.store});

  final Store<AppState> store;
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
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
      
      routerConfig: _appRouter.config()
    );
  }
}

   // final Map<String, WidgetBuilder> routes = Routes.extractRoutes();
   //
   //
   //  return Navigator(
   //    onGenerateRoute: (settings) {
   //        final String? routeName = settings.name;
   //
   //       if (routeName != null && routes.containsKey(routeName)) {
   //        return MaterialPageRoute(builder: routes[routeName]!);
   //      }
   //
   //      return MaterialPageRoute(builder: (context) =>  const NotFoundScreen());
   //
   //    },
   //  );

        // WidgetBuilder builder;

        // switch (settings.name) {
        //   case '/':
        //     builder = (BuildContext context) => const HomeScreen();
        //     break;
        //   case '/authentication':
        //     builder = (BuildContext context) => const AuthenticationScreen();
        //     break;
        //   default:
        //     throw Exception('Invalid route: ${settings.name}');
        // }
        // return MaterialPageRoute(builder: builder, settings: settings);


// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Second Page'),
//     );
//   }
// }
