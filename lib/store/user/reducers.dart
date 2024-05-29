import 'package:redux/redux.dart';
import 'package:home/models/user/user.dart';
import 'package:home/store/user/actions.dart';
import 'package:home/models/data_state.dart';

final userReducer = combineReducers<DataState<User>>([
  TypedReducer<DataState<User>, CreateUserAction>(onLogin).call
]);

DataState<User> onLogin(
  DataState<User> state,
  CreateUserAction action
) {
  return state.copyWith(isLoading: true);
}

