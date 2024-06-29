import 'package:home/models/user/user.dart';
import 'package:redux/redux.dart';
import 'package:home/api/user.dart';
import 'package:home/store/user/action.dart';
import 'package:home/store/application_state.dart';

class UsersMiddleware implements MiddlewareClass<AppState> {
  final UserApi api;

  UsersMiddleware(this.api);

  @override
  void call(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    if (action is LoginUser) {
      store.dispatch(SetUserIsLoading(true));

      try {
        // final User user = await api.login(action.username, action.password);
        // store.dispatch(SetUserData(user));
        next(action);
      } on ApiException catch (e) {
        store.dispatch(SetUserError(e.message));
      }
    }
  }
}
