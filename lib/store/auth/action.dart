import 'package:home/models/auth/auth.dart';

abstract class AuthAction {}

class SetLoginIsLoading implements AuthAction {
  final bool isLoading;

  SetLoginIsLoading(this.isLoading);

  @override
  String toString() => "$SetLoginIsLoading";
}

class SetLoginIsAuthenticated implements AuthAction {
  final bool isAuthenticated;

  SetLoginIsAuthenticated(this.isAuthenticated);

  @override
  String toString() => "$SetLoginIsAuthenticated";
}

class SetLoginError implements AuthAction {
  final String error;
  
  SetLoginError(this.error);

  @override
  String toString() => "$SetLoginError";
}

class SetLoginData implements AuthAction {
  final Credentials data;

  SetLoginData(this.data);

  @override
  String toString() => "$SetLoginData";
}

// -- -- --
class LoginUser implements AuthAction {
  final String username;
  final String password;

  LoginUser(this.username, this.password);
}
