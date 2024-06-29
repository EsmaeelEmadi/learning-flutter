import 'package:flutter/material.dart';
// import 'package:home/store/theme/default.dart';

class ThemeState {
  final Brightness brightness;
  final bool showMainMenu;
  final bool isSearch;

  ThemeState({
    required this.brightness,
    required this.showMainMenu,
    required this.isSearch,
  });

  factory ThemeState.initial() {
    return ThemeState(
      brightness: Brightness.light,
      showMainMenu: false,
      isSearch: false,
    );
  }

  ThemeState copyWith(Brightness brightness, bool showMainMenu) {
    return ThemeState(
      brightness: brightness,
      showMainMenu: showMainMenu,
      isSearch: isSearch
    );
  }
}
