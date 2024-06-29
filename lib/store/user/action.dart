import 'package:home/models/user/user.dart';

abstract class UserAction {}

class SetUserIsLoading implements UserAction {
  final bool isLoading;

  SetUserIsLoading(this.isLoading);

  @override
  String toString() => "$SetUserIsLoading";
}

class SetUserIsAuthenticated implements UserAction {
  final bool isAuthenticated;

  SetUserIsAuthenticated(this.isAuthenticated);

  @override
  String toString() => "$SetUserIsAuthenticated";
}

class SetUserError implements UserAction {
  final String error;

  SetUserError(this.error);

  @override
  String toString() => "$SetUserError";
}

class SetUserData implements UserAction {
  final User data;

  SetUserData(this.data);

  @override
  String toString() => "$SetUserData";
}

// -- -- --
class LoginUser implements UserAction {
  final String username;
  final String password;

  LoginUser(this.username, this.password);
}
