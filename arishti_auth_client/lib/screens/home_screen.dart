// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:arishti_auth_client/redux/store/store.dart';
import 'package:arishti_auth_client/redux/actions/user.action.dart';
import 'package:arishti_auth_client/screens/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  bool isLoggedIn = false, isSignInPage = true;
  HomeScreen(bool isLoggedIn, bool isSignInPage) {
    this.isLoggedIn = isLoggedIn;
    this.isSignInPage = isSignInPage;
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Arishti Auth"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo[900],
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 25.0,
                semanticLabel: 'Logout',
              ),
              tooltip: 'Logout',
              onPressed: () async {
                await StoreProvider.of<AppState>(context)
                    .dispatch(IsLoggedInCheck(widget.isLoggedIn))
                    .then(setState(() {
                  widget.isLoggedIn = false;
                })).then(
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthScreen(false, true))),
                );
              },
            ),
          ],
        ),
        body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("Home Screen"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
