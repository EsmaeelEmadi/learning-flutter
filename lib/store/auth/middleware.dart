import 'package:home/store/auth/action.dart';
import 'package:home/utils/storage.dart';
import 'package:redux/redux.dart';
import 'package:home/api/auth.dart';
import 'package:home/store/application_state.dart';

class AuthMiddleware implements MiddlewareClass<AppState> {
  final AuthApi api;

  AuthMiddleware(this.api);

  @override
  void call(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    if (action is LoginUser) {
      store.dispatch(SetLoginIsLoading(true));

      try {
        final response = await api.login(action.username, action.password);
        store.dispatch(SetLoginData(response));
        store.dispatch(SetLoginIsAuthenticated(true));
        await TokenStorage.saveTokens(
          response.accessToken?.accessToken,
          response.accessToken?.expiresIn,
          response.refreshToken?.refreshToken,
          response.refreshToken?.refreshExpiresIn,
          response.issuedAt,
        );
        // locator<AppRouter>().replaceAll([HomeRoute()]);
      } on ApiException catch (e) {
        store.dispatch(SetLoginError(e.message));
      } finally {
        store.dispatch(SetLoginIsLoading(false));
      }

      next(action);
    }
  }
}
