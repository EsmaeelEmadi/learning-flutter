import 'package:home/store/is_authenticated/actions.dart';
import 'package:redux/redux.dart';
import 'package:home/models/is_authenticated/is_authenticated.dart';

final isAuthenticatedReducer = combineReducers<IsAuthenticated>([
  TypedReducer<IsAuthenticated,SetIsAuthenticated>(onSetIsAuthenticated).call 
  
]);

IsAuthenticated onSetIsAuthenticated(
  IsAuthenticated state,
  SetIsAuthenticated action
) { 
  return state;
}
