import 'package:flutter/material.dart';

abstract class ThemeActions {}

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

