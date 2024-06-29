import 'package:flutter/material.dart';
import 'package:home/models/user/user.dart';

@immutable
class UserState {
  final bool isAuthenticated;
  final bool isLoading;
  final String error;
  final User data;

  const UserState({
    required this.isAuthenticated,
    required this.isLoading,
    required this.error,
    required this.data,
  });

  factory UserState.initial() {
    return UserState(
      isAuthenticated: false,
      isLoading: false,
      error: "",
      data: User(),
    );
  }

  UserState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? error,
    User? data,
  }) {
    print("****** $isAuthenticated");
    return UserState(
      isAuthenticated: isAuthenticated ?? false,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          isAuthenticated == other.isAuthenticated &&
          isLoading == other.isLoading &&
          error == other.error &&
          data == other.data;

  @override
  int get hashCode => isLoading.hashCode ^ data.hashCode;
}
