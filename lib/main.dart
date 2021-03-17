//started at 16:20 march 17 2021
import 'package:flutter/material.dart';
import 'package:mvvm_news_app/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) {
          return SplashScreen();
        },
      },
    );
  }
}
