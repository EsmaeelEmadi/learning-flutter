// import 'package:flutter/material.dart';
// import 'package:home/store/theme/actions.dart';
//
// class ThemeReducer {
//   static ThemeData themeDataReducer(ThemeData themeData, dynamic action) {
//     if (action is ThemeActions) {
//       return action.current;
//     }
//     return themeData;
//   }
// }

import 'package:home/models/theme/theme.dart';
import 'package:home/store/theme/actions.dart';
import 'package:redux/redux.dart';

final themeReducer = combineReducers<ThemeState>([
  TypedReducer<ThemeState, SetTheme>(onSetTheme).call,
  TypedReducer<ThemeState, SetShowMainMenu>(onSetShowMainMenu).call,
  TypedReducer<ThemeState, SetIsSearch>(onSetIsSearch).call,
]);

ThemeState onSetIsSearch(
  ThemeState state,
  SetIsSearch action,
) {
  ThemeState newTheme = ThemeState(
      brightness: state.brightness,
      showMainMenu: state.showMainMenu,
      isSearch: action.isSearch);
  return newTheme;
}

ThemeState onSetTheme(
  ThemeState state,
  SetTheme action,
) {
  ThemeState newTheme = ThemeState(
      brightness: action.brightness,
      showMainMenu: state.showMainMenu,
      isSearch: state.isSearch);
  return newTheme;
}

ThemeState onSetShowMainMenu(
  ThemeState state,
  SetShowMainMenu action,
) {
  ThemeState newTheme = ThemeState(
      brightness: state.brightness,
      showMainMenu: action.showMainMenu,
      isSearch: state.isSearch);
  return newTheme;
}
