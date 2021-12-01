import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_demo/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState == null)
      setState(() {
        changebutton:
        true;
      });

    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoute.homeroute);
    setState(() {
      changebutton:
      false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/login_image_2.png",
                  fit: BoxFit.cover,
                  height: 200,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Username cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changebutton ? 40 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          child: changebutton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: context.theme.buttonColor,
                              borderRadius: BorderRadius.circular(
                                  changebutton ? 20 : 10)),
                        ),
                      )

                      // ElevatedButton(
                      // child: Text("Login"),
                      // style: TextButton.styleFrom(minimumSize: Size(50, 40)),
                      // onPressed: () {
                      //   Navigator.pushNamed(context, MyRoute.homeroute);

                      // },

                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
