// @dart=2.9

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

dynamic headerValue = null;

void setup() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  headerValue = (prefs.get("profile") != null) ? prefs.get("profile") : null;
}

dynamic signin = (email, password) async =>
    await http.post(Uri.parse('http://localhost:5000/user/signin'), body: {
      email,
      password
    }, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $headerValue',
    });
dynamic signup =
    (firstName, lastName, email, password, confirmPassword) async =>
        await http.post(Uri.parse('http://localhost:5000/user/signup'), body: {
          firstName,
          lastName,
          email,
          password,
          confirmPassword,
        }, headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $headerValue',
        });
