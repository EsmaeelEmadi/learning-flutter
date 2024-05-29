import 'package:home/models/user/user.dart';

abstract class UsersAction {}

class CreateUserAction implements UsersAction { 
  @override
  String toString() => "$CreateUserAction";
}

class LoadUserSucceededAction implements UsersAction {
  final User users;

  LoadUserSucceededAction(this.users);

  @override
  String toString() => "$LoadUserSucceededAction";
}

class LoadUserFailedAction implements UsersAction {
  final String error;

  LoadUserFailedAction(this.error);

  @override
  String toString() => "$LoadUserFailedAction($error)";
}
