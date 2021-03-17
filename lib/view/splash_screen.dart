import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000)).then((_) {});
    return SafeArea(
      child: Scaffold(
        body: Text("Splashscreen"),
      ),
    );
  }
}
