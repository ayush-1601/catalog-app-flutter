import 'package:flutter/material.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/pages/cart_page.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/login_page.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoute.homeroute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoute.homeroute: (context) => HomePage(),
        MyRoute.loginroute: (context) => LoginPage(),
        MyRoute.cartRoute: (context) => CartPage(),
      },
    );
  }
}
