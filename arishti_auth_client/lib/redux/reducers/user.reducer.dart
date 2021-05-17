// @dart=2.9

import 'package:arishti_auth_client/redux/actions/user.action.dart';
import 'package:arishti_auth_client/redux/store/store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is SignInDone) {
    return AppState.copyWith(
        prev: prevState, email: action.email, password: action.password);
  } else if (action is SignUpDone) {
    return AppState.copyWith(
        prev: prevState,
        firstName: action.firstName,
        lastName: action.lastName,
        email: action.email,
        password: action.password,
        confirmPassword: action.confirmPassword);
  } else {
    return AppState(
        firstName: prevState.firstName,
        lastName: prevState.lastName,
        email: prevState.email,
        password: prevState.password,
        confirmPassword: prevState.confirmPassword);
  }
}
