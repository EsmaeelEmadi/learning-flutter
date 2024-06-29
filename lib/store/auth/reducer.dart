import 'package:home/store/auth/action.dart';
import 'package:redux/redux.dart';
import 'package:home/models/auth/state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, SetLoginIsAuthenticated>(onSetUserIsAuthenticated)
      .call,
  TypedReducer<AuthState, SetLoginIsLoading>(onSetUserIsLoading).call,
  TypedReducer<AuthState, SetLoginError>(onSetUserError).call,
  TypedReducer<AuthState, SetLoginData>(onSetUserData).call,
]);

AuthState onSetUserIsAuthenticated(
  AuthState state,
  SetLoginIsAuthenticated action,
) {
  return state.copyWith(isAuthenticated: action.isAuthenticated);
}

AuthState onSetUserIsLoading(
  AuthState state,
  SetLoginIsLoading action,
) {
  return state.copyWith(isLoading: action.isLoading);
}

AuthState onSetUserError(
  AuthState state,
  SetLoginError action,
) {
  return state.copyWith(error: action.error);
}

AuthState onSetUserData(
  AuthState state,
  SetLoginData action,
) {
  return state.copyWith(data: action.data);
}
