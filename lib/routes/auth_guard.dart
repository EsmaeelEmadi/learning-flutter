import 'package:auto_route/auto_route.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:redux/redux.dart';

class AuthGuard extends AutoRouteGuard {
   final Store<AppState> store;

  AuthGuard(this.store);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final bool isAuthenticated = store.state.auth.isAuthenticated;

    if(isAuthenticated) {
      resolver.next(true);
    } else {
        resolver.redirect(
          LoginRoute(onResult: (success) {
            resolver.next(success);
          }
        )
      );
    }
  }
}