// @dart=2.9

import 'package:arishti_auth_client/redux/actions/user.action.dart';
import 'package:redux/redux.dart';
import 'package:arishti_auth_client/redux/store/store.dart';
import 'package:arishti_auth_client/redux/api/user.api.dart' as api;

class UserSignIn {
  String email, password;

  UserSignIn({this.email, this.password});
}

class UserSignUp {
  String firstName, lastName, email, password, confirmPassword;

  UserSignUp(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.confirmPassword});
}

void appStateMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  if (action is SignIn) {
    UserSignIn currUser = await api.signin(action.email, action.password);
    //history.push("/")
    store.dispatch(
        SignInDone(email: currUser.email, password: currUser.password));
  } else if (action is SignUp) {
    UserSignUp currUser = await api.signup(action.firstName, action.lastName,
        action.email, action.password, action.confirmPassword);
    //history.push("/")
    store.dispatch(SignUpDone(
        firstName: currUser.firstName,
        lastName: currUser.lastName,
        email: currUser.email,
        password: currUser.password,
        confirmPassword: currUser.confirmPassword));
  }
  next(action);
}
