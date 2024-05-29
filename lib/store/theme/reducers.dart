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

final themeReducer =
    combineReducers<Theme>([
  TypedReducer<Theme, SetTheme>(onSetTheme).call,
  TypedReducer<Theme, SetShowMainMenu>(onSetShowMainMenu).call,
]);

Theme onSetTheme(
  Theme state,
  SetTheme action,
) {
  Theme newTheme = Theme(action.brightness, state.showMainMenu);
  return newTheme;
}

Theme onSetShowMainMenu(
  Theme state,
  SetShowMainMenu action,
) {
  Theme newTheme = Theme(state.brightness, action.showMainMenu);
  return newTheme;
}
