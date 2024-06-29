import 'package:flutter/material.dart';

abstract class ThemeActions {}

class SetIsSearch implements ThemeActions {
  final bool isSearch;

  SetIsSearch(this.isSearch);

  @override
  String toString() => "$SetIsSearch";
}

class SetShowMainMenu implements ThemeActions {
  final bool showMainMenu;

  SetShowMainMenu(this.showMainMenu);

  @override
  String toString() => "$SetShowMainMenu";
}

class SetTheme implements ThemeActions {
  final Brightness brightness;

  SetTheme(this.brightness);

  @override
  String toString() => "$SetTheme";
}
