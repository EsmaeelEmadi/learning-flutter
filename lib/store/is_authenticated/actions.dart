import 'package:home/models/is_authenticated/is_authenticated.dart';

abstract class IsAuthenticatedAction {}

class SetIsAuthenticated implements IsAuthenticatedAction { 
  @override
  String toString() => "$SetIsAuthenticated";
}

class LoadIsAuthenticatedSucceededAction implements IsAuthenticatedAction {
  final IsAuthenticated isAuthenticated;

  LoadIsAuthenticatedSucceededAction(this.isAuthenticated);

  @override
  String toString() => "$LoadIsAuthenticatedSucceededAction";
}

class LoadIsAuthenticatedFailedAction implements IsAuthenticatedAction {
  final IsAuthenticated isAuthenticated;

  LoadIsAuthenticatedFailedAction(this.isAuthenticated);

  @override
  String toString() => "$LoadIsAuthenticatedFailedAction";
}
