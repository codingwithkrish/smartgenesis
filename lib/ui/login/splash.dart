import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartgenesis/ui/login/register.dart';

import '../Products/productlist.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      check();
    });
    super.initState();
  }

  check() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? email = await prefs.getBool('login');
    print(email);
    if (email == true) {
      Get.offAll(ProductList());
    } else {
      Get.offAll(Register());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Lottie.network(
              "https://assets6.lottiefiles.com/packages/lf20_u8o7BL.json")),
    );
  }
}
