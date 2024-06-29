import 'package:flutter/material.dart';
import 'package:home/models/auth/auth.dart';

@immutable
class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String error;
  final Credentials data;

  const AuthState({
    required this.isAuthenticated,
    required this.isLoading,
    required this.error,
    required this.data,
  });

  factory AuthState.initial(bool isAuthenticated) {
    return AuthState(
      isAuthenticated: isAuthenticated,
      isLoading: false,
      error: "",
      data: Credentials(),
    );
  }

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? error,
    Credentials? data,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          isAuthenticated == other.isAuthenticated &&
          isLoading == other.isLoading &&
          error == other.error &&
          data == other.data;

  @override
  int get hashCode => isLoading.hashCode ^ data.hashCode;
}
