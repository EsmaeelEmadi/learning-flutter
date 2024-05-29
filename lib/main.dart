import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:home/api/user.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:home/store/reducers.dart';
import 'package:home/store/user/middleware.dart';
import 'package:redux/redux.dart';

void main() {
  final dio = Dio();
  dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
  final api = UserApi(dio);

  final store = Store<AppState>(
    reducer,
    initialState: AppState.initial(),
    middleware: [
      UsersMiddleware(api).call,
    ],
  );

  final appRouter = AppRouter();

  runApp(MyApp(store: store, appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final AppRouter appRouter;

  const MyApp({super.key, required this.store, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.lightBlue,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.blueAccent,
                    brightness: state.theme.brightness,
                  ),
                  scaffoldBackgroundColor: state.theme.brightness ==
                          Brightness.light
                      ? Colors.white // Solid white background for light mode
                      : null, // Default background for dark mode
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(
                      //   // color: state.theme.brightness == Brightness.light ? Colors.white : Colors.grey[850]!,
                      //   width: 0,
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                      // (
                      //             // color: state.theme.brightness == Brightness.light ? Colors.white : Colors.grey[850]!,
                      //             width: 0,
                      //           ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(
                      //   color: Colors.blue, // Color for the focused border
                      // ),
                    ),
                  ),
                  useMaterial3: true,
                ),
                routerConfig: appRouter.config());
          }),
    );
  }
}
