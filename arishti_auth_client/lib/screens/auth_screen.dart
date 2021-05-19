// @dart=2.9

import 'package:flutter/material.dart';
import 'package:arishti_auth_client/redux/store/store.dart';
import 'package:arishti_auth_client/redux/actions/user.action.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:arishti_auth_client/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  bool isLoggedIn = false, isSignInPage = true;
  AuthScreen(bool isLoggedIn, bool isSignInPage) {
    this.isLoggedIn = isLoggedIn;
    this.isSignInPage = isSignInPage;
  }
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String firstName, lastName, email, password, confirmPassword;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("auth screen");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Arishti Auth"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo[900],
        ),
        body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    "WELCOME TO ARISHTI",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      (widget.isSignInPage == true
                          ? Container()
                          : Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    firstName = val;
                                  });
                                },
                                validator: (String val) {
                                  if (val == "") return "Enter First Name";
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "First Name",
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: false,
                                  icon: Icon(Icons.person),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                maxLength: 50,
                                maxLines: 1,
                              ),
                            )),
                      (widget.isSignInPage == true
                          ? Container()
                          : Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    lastName = val;
                                  });
                                },
                                validator: (String val) {
                                  if (val == "") return "Enter Last Name";
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Last Name",
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: false,
                                  icon: Icon(Icons.person),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                maxLength: 50,
                                maxLines: 1,
                              ),
                            )),
                      Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          validator: (String val) {
                            if (val == "") return "Enter Email";
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: false,
                            icon: Icon(Icons.mail),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          maxLength: 50,
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          validator: (String val) {
                            if (val.length < 6)
                              return "Enter Password with minimum of 6 characters";
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: false,
                            icon: Icon(Icons.lock),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: false,
                          maxLength: 50,
                          maxLines: 1,
                        ),
                      ),
                      (widget.isSignInPage == true
                          ? Container()
                          : Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    confirmPassword = val;
                                  });
                                },
                                validator: (String val) {
                                  if (val.length < 6)
                                    return "Enter Password with minimum of 6 characters";
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: false,
                                  icon: Icon(Icons.lock),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                maxLength: 50,
                                maxLines: 1,
                              ),
                            )),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: Text(
                                widget.isSignInPage ? "SIGN IN" : "REGISTER",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              color: Colors.blue,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  if (widget.isSignInPage == true) {
                                    await StoreProvider.of<AppState>(context)
                                        .dispatch(SignIn(email, password))
                                        .dispatch(
                                            IsLoggedInCheck(widget.isLoggedIn))
                                        .then(setState(() {
                                      widget.isLoggedIn = false;
                                    })).then(
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(true, true))),
                                    );
                                  } else {
                                    await StoreProvider.of<AppState>(context)
                                        .dispatch(SignUp(firstName, lastName,
                                            email, password, confirmPassword))
                                        .dispatch(
                                            IsLoggedInCheck(widget.isLoggedIn))
                                        .then(setState(() {
                                      widget.isLoggedIn = false;
                                    })).then(Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(true, true))));
                                  }
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text((widget.isSignInPage == true)
                        ? "Don't have an account? "
                        : "Already have an account? "),
                    FlatButton(
                      color: Colors.transparent,
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(IsSignInPageCheck(widget.isSignInPage))
                            .then(widget.isSignInPage = !widget.isSignInPage);
                      },
                      child: Text(
                        (widget.isSignInPage == true) ? "Sign Up" : "Sign In",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
