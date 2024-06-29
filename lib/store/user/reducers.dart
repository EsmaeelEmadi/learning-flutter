import 'package:home/store/user/action.dart';
import 'package:redux/redux.dart';
import 'package:home/models/user/state.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, SetUserIsAuthenticated>(onSetUserIsAuthenticated)
      .call,
  TypedReducer<UserState, SetUserIsLoading>(onSetUserIsLoading).call,
  TypedReducer<UserState, SetUserError>(onSetUserError).call,
  TypedReducer<UserState, SetUserData>(onSetUserData).call,
]);

UserState onSetUserIsAuthenticated(
  UserState state,
  SetUserIsAuthenticated action,
) {
  print("!!!!!!!!!!! ${action.isAuthenticated}");
  // return state.copyWith(isAuthenticated: action.isAuthenticated);
  return UserState(
    isAuthenticated: false,
    isLoading: state.isLoading,
    error: state.error,
    data: state.data,
  );
}

UserState onSetUserIsLoading(
  UserState state,
  SetUserIsLoading action,
) {
  return state.copyWith(isLoading: action.isLoading);
}

UserState onSetUserError(
  UserState state,
  SetUserError action,
) {
  return state.copyWith(error: action.error);
}

UserState onSetUserData(
  UserState state,
  SetUserData action,
) {
  return state.copyWith(data: action.data);
}
