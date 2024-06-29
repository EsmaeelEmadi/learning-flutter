import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:home/api/client.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:home/store/reducers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final client = DioClient();
  final isAuthenticated = await client.isAuthenticated();
  // final isAuthenticated = true;

  final store = Store<AppState>(
    reducer,
    initialState: AppState.initial(isAuthenticated),
    // middleware: [
    //   AuthMiddleware(authApi).call,
    // ],
  );

  final appRouter = AppRouter(store: store);

  runApp(MyApp(store: store, appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final AppRouter appRouter;

  const MyApp({
    super.key,
    required this.store,
    required this.appRouter,
  });

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
              bottomSheetTheme: const BottomSheetThemeData(
                surfaceTintColor: Colors.transparent,
              ),
              primarySwatch: Colors.lightBlue,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blueAccent,
                brightness: state.theme.brightness,
              ),
              scaffoldBackgroundColor:
                  state.theme.brightness == Brightness.light
                      ? Colors.white
                      : Colors.grey.shade900,
              useMaterial3: true,
            ),
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
