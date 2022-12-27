// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  TextEditingController loginemal = new TextEditingController();
  TextEditingController loginpass = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  bool bar = false;

  AuthenticationController() {}
  register() async {
    final prefs = await SharedPreferences.getInstance();
    if (email.text.isEmpty || password.text.isEmpty || name.text.isEmpty) {
      return false;
    }
    try {
      await prefs.setBool('login', true);
      await prefs.setString('email', email.text);
      await prefs.setString('pass', password.text);
      await prefs.setString('name', name.text);
      print(prefs.getString('email'));
      return true;
    } catch (e) {
      return false;
    }
  }

  login() async {
    final prefs = await SharedPreferences.getInstance();
    final String? emails = await prefs.getString('email');
    final String? pass = await prefs.getString('pass');
    print(emails);
    if ((loginemal.text == emails) && loginpass.text == pass) {
      await prefs.setBool('login', true);
      return true;
    }
    return false;
  }
}
