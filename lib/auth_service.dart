import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  static const dummyEmail = 'kosong1118@gmail.com'; //can change here
  static const dummyPassword = '123456';  //can change here
  static const dummyPhoneNumber = '';
  static const dummyUserName = '';
  static const dummySignUpEmail = 'signup@gmail.com';  //can change here
  static const dummySignUpPassword = '123456';  //can change here

  String? _userEmail;
  String? _userPhoneNumber;
  String? _userName;

  String? get userEmail => _userEmail;
  String? get userPhoneNumber => _userPhoneNumber;
  String? get userName => _userName;

  Future<void> signUp(String email, String password) async {
    // Simulate sign-up logic
    if (email == dummySignUpEmail && password == dummySignUpPassword) {
      _userEmail = email;
      notifyListeners();
    } else {
      throw Exception('Sign-up failed');
    }
  }

  Future<void> signIn(String email, String password) async {
    // Simulate sign-in logic
    if (email == dummyEmail && password == dummyPassword) {
      _userEmail = email;
      notifyListeners();
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> signOut() async {
    _userEmail = null;
    notifyListeners();
  }
}
