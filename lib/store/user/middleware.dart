import 'package:redux/redux.dart';
import 'package:home/api/user.dart';
import 'package:home/store/application_state.dart';
import 'package:home/store/user/actions.dart';

class UsersMiddleware implements MiddlewareClass<AppState> {
  final UserApi api;

  UsersMiddleware(this.api);

  @override
  void call(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    // DO NOT FORGET THIS. If you do, this middleware
    // will "break" the chain of NextDispatcher's
    next(action);

    if (action is CreateUserAction) {
      try {
        final users = await api.createUser();
        store.dispatch(LoadUserSucceededAction(users));
      } on ApiException catch (e) {
        store.dispatch(LoadUserFailedAction(e.message));
      }
    }
  }
}
