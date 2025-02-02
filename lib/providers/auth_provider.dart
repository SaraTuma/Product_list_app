import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  String _email ='Nothing';
  String _password ='Nothing';
  bool _isLoggedIn = false;

  String get email => _email;
  String get password => _password;
  bool get isLoggedIn => _isLoggedIn;

  void login({required String email, required String password}) {
    _email = email;
    _password = password;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _email = "";
    _password = "";
    _isLoggedIn = false;
    notifyListeners();
  }
}