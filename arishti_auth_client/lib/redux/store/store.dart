// @dart=2.9

class AppState {
  String firstName, lastName, email, password, confirmPassword;
  bool isLoggedIn, isSignInPage;

  AppState(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.confirmPassword,
      this.isLoggedIn,
      this.isSignInPage});

  AppState.copyWith(
      {AppState prev,
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      bool isLoggedIn,
      bool isSignInPage}) {
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.confirmPassword = confirmPassword ?? this.confirmPassword;
    this.isLoggedIn = isLoggedIn ?? this.isLoggedIn;
    this.isSignInPage = isSignInPage ?? this.isSignInPage;
  }

  AppState.initial() {
    this.firstName = "";
    this.lastName = "";
    this.email = "";
    this.password = "";
    this.confirmPassword = "";
    this.isLoggedIn = false;
    this.isSignInPage = true;
  }
}
