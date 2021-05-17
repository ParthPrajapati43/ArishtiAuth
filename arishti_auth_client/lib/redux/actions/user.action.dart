// @dart=2.9

abstract class Authenticaton {}

class SignIn extends Authenticaton {
  String email, password;

  SignIn({this.email, this.password});
}

class SignUp extends Authenticaton {
  String firstName, lastName, email, password, confirmPassword;

  SignUp(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.confirmPassword});
}

class SignInDone extends Authenticaton {
  String email, password;

  SignInDone({this.email, this.password});
}

class SignUpDone extends Authenticaton {
  String firstName, lastName, email, password, confirmPassword;

  SignUpDone(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.confirmPassword});
}
