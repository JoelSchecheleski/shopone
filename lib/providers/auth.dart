import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {


  Future<void> _autenticate(String email, String password,
      String urlSegment) async {
    final _url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCA9dczL3vgGmdDZpLmzVgIFz3G35yUGcA';
    final response = await http.post(
      _url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
    final responseBody = json.decode(response.body);
    if(responseBody["error"] != null) {
      throw AuthException(responseBody["error"]['message']);
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    // signUp
    return _autenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    // signInWithPassword
    return _autenticate(email, password, "signInWithPassword");
  }

}
