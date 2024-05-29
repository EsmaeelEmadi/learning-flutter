import 'package:home/store/application_state.dart';
import 'package:home/store/theme/reducers.dart';
import 'package:home/store/is_authenticated/reducers.dart';

AppState reducer(AppState state, action) {
  return AppState(themeReducer(state.theme, action),
      isAuthenticatedReducer(state.isAuthenticated, action));
}

    // userReducer(state.userState, action),
    // isAuthenticatedReducer(state.isAuthenticated, action)


// import 'package:home/store/application_state.dart';
// import 'package:home/store/theme/default.dart';
//
// AppState reducer(AppState state, action) {
//   return AppState(
//       initialTheme
//   );
// }

// import 'package:home/store/application_state.dart';
// import 'package:home/store/user/reducers.dart';
//
// // This is the top-level reducer which combines all other reducers.
// // By combining them in this way, isolated state machines in our app can be
// // in different classes, folders and files, making it easier to manage.
// ApplicationState reducer(ApplicationState state, action) {
//   return ApplicationState(
//     userReducer(state.userState, action),
//     isAuthenticatedReducer(state.isAuthenticated, action)
//   );
// }
