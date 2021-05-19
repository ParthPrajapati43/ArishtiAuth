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
    store.dispatch(SignInDone(currUser.email, currUser.password));
  } else if (action is SignUp) {
    UserSignUp currUser = await api.signup(action.firstName, action.lastName,
        action.email, action.password, action.confirmPassword);
    //history.push("/")
    store.dispatch(SignUpDone(currUser.firstName, currUser.lastName,
        currUser.email, currUser.password, currUser.confirmPassword));
  } else if (action is IsLoggedInCheck) {
    bool status = (action.isLoggedIn == true) ? false : true;
    store.dispatch(IsLoggedInChecked(status));
  } else if (action is IsSignInPageCheck) {
    bool status = (action.isSignInPage == true) ? false : true;
    store.dispatch(IsSignInPageChecked(status));
  }
  next(action);
}
