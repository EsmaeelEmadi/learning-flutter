import 'package:home/store/application_state.dart';
import 'package:home/store/auth/reducer.dart';
import 'package:home/store/theme/reducers.dart';

AppState reducer(AppState state, action) {
  return AppState(
    themeReducer(state.theme, action), authReducer(state.auth, action)
  );
}