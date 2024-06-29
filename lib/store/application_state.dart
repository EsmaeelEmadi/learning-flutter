import 'package:flutter/material.dart';
import 'package:home/models/auth/state.dart';
import 'package:home/models/theme/theme.dart';

@immutable
class AppState {
  final ThemeState theme;
  final AuthState auth;

  const AppState(this.theme, this.auth);

  factory AppState.initial(bool isAuthenticated) {
    return AppState(
      ThemeState.initial(),
      AuthState.initial(isAuthenticated),
    );
  }

  AppState copyWith() {
    return AppState(theme, auth);
  }
}
