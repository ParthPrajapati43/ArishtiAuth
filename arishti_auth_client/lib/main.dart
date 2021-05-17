// @dart=2.9

import 'package:arishti_auth_client/screens/signin_screen.dart';
import 'package:arishti_auth_client/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:arishti_auth_client/redux/reducers/user.reducer.dart';
import 'package:arishti_auth_client/redux/store/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arishti_auth_client/redux/middleware/user.middleware.dart';

void main() {
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(
      prefs: prefs,
    ));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  MyApp({this.prefs});

  @override
  Widget build(BuildContext context) {
    final Store store = Store<AppState>(reducers,
        initialState: AppState.initial(), middleware: [appStateMiddleware]);
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: "Arishti Auth",
        home: SignInScreen(),
      ),
    );
  }
}
