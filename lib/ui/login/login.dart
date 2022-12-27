import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smartgenesis/controllers/authenticationcontr.dart';
import 'package:smartgenesis/ui/Products/productlist.dart';
import 'package:smartgenesis/ui/login/register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
        init: AuthenticationController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
                child: ListView(
              children: [
                Container(
                  color: Colors.blueGrey,
                  height: 250,
                  width: 200,
                  child: Lottie.network(
                      "https://assets6.lottiefiles.com/packages/lf20_u8o7BL.json",
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 2),
                ),
                Transform.translate(
                  offset: Offset(0, -18),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Text(
                      "Login to your Account",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -30),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.g_mobiledata,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.bubble_chart_rounded,
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("or use your email account"),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: controller.loginemal,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Email',
                                helperText: 'eg. xyz@gmail.com',
                                labelText: "Your email *"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: controller.loginpass,
                            obscureText: true,
                            maxLength: 12,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Password',
                                helperText: 'eg. *******',
                                labelText: "Your Password *"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            bool check = await controller.login();
                            if (check == true) {
                              Get.offAll(ProductList());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Invalid Credential")));
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            padding: EdgeInsets.symmetric(vertical: 25),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(Register());
                          },
                          child: RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  new TextSpan(text: "Don't have an Account ?"),
                                  new TextSpan(
                                      text: " Register",
                                      style: TextStyle(color: Colors.blueGrey))
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
          );
        });
  }
}
