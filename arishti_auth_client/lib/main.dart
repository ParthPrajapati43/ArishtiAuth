// @dart=2.9

import 'package:arishti_auth_client/screens/auth_screen.dart';
import 'package:arishti_auth_client/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:arishti_auth_client/redux/reducers/user.reducer.dart';
import 'package:arishti_auth_client/redux/store/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arishti_auth_client/redux/middleware/user.middleware.dart';

/* void main() {
  print("main fn");
  runApp(
    MaterialApp(
      home: AuthScreen(false, true),
    ),
  );
} */

void main() {
  print("void main");
  SharedPreferences.getInstance().then((prefs) {
    runApp(
      MyApp(
        prefs: prefs,
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final bool isLoggedIn = false, isSignInPage = true;
  MyApp({this.prefs});

  @override
  Widget build(BuildContext context) {
    print("main");
    final Store store = Store<AppState>(reducers,
        initialState: AppState.initial(), middleware: [appStateMiddleware]);
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: "Arishti Auth",
        initialRoute: "/auth",
        routes: {
          "/auth": (context) => AuthScreen(isLoggedIn, isSignInPage),
          "/home": (context) => HomeScreen(isLoggedIn, isSignInPage),
        },
        home: AuthScreen(isLoggedIn, isSignInPage),
      ),
    );
  }
}
