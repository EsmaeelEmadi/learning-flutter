import 'package:home/store/theme/default.dart';
import 'package:home/models/theme/theme.dart';
import 'package:home/models/is_authenticated/is_authenticated.dart';

class AppState {
  final Theme theme;
  final IsAuthenticated isAuthenticated;

  AppState(this.theme, this.isAuthenticated);

  factory AppState.initial() {
    return AppState(Theme(InitialTheme.brightness, false), IsAuthenticated(false));
  }

  AppState copyWith() {
    return AppState(theme, isAuthenticated);
  }
}

// //   AppState copyWith({
// //     DataState<User>? usersState,
// //   }) {
// //     return AppState(
// //       usersState ?? userState,
// //       isAuthenticated 
// //     );
// //   }




// // import 'package:home/models/user/user.dart';
// // import 'package:home/models/data_state.dart';
// //
// // class AppState {
// //   final DataState<User> userState;
// //
// //   AppState(
// //     this.userState,
// //     this.isAuthenticated
// //   );
// //
// //   factory AppState.initial() {
// //     return AppState(
// //       DataState<User>.initial(),
// //       IsAuthenticated(false)
// //     );
// //   }
// //
// //   AppState copyWith({
// //     DataState<User>? usersState,
// //   }) {
// //     return AppState(
// //       usersState ?? userState,
// //       isAuthenticated 
// //     );
// //   }
// //
// //   // @override
// //   // int get hashCode => hashValues(usersState);
// //   //
// //   // @override
// //   // bool operator ==(Object other) {
// //   //   return identical(this, other) ||
// //   //       (other is ApplicationState &&
// //   //           usersState == other.usersState 
// //   //           );
// //   // }
// // }
