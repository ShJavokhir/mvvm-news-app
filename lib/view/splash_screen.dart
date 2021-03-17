import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_news_app/viewmodel/splash_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this is for status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    Future.delayed(Duration(milliseconds: 2000)).then((_) {});
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 29, 46, 1),
      body: Container(
        child: SafeArea(
          child: buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    var splashScreenViewModel =
        Provider.of<SplashScreenViewModel>(context, listen: false);
    Future.delayed(Duration(milliseconds: 1350)).then((value) {
      splashScreenViewModel.opacityOfBottomText = 1.0;
    });
    Future.delayed(Duration(milliseconds: 2500)).then((value) {
      Navigator.of(context).pushReplacementNamed("/topHeadlines");
    });
    final Shader linearGradient = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(31, 255, 134, 1),
        Color.fromRGBO(0, 255, 240, 0.5)
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Open source",
                  style: TextStyle(
                      fontFamily: "AlfaSlabOne",
                      fontSize: 30,
                      foreground: Paint()..shader = linearGradient),
                ),
                SizedBox(
                  width: 500,
                  child: TypewriterAnimatedTextKit(
                    //   //  splashScreenViewModel.opacityOfBottomText = 1;
                    // },

                    isRepeatingAnimation: false,
                    speed: Duration(milliseconds: 110),
                    text: ["News app"],
                    textStyle: TextStyle(
                        fontFamily: "AlfaSlabOne",
                        fontSize: 50,
                        foreground: Paint()..shader = linearGradient),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Consumer<SplashScreenViewModel>(builder: (context, data, child) {
            return AnimatedOpacity(
              opacity: data.opacityOfBottomText,
              duration: Duration(milliseconds: 1000),
              // The green box must be a child of the AnimatedOpacity widget.
              child: Container(
                alignment: Alignment.center,
                child: Text("By Javokhir",
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "AlfaSlabOne",
                      fontSize: 20,
                    )),
              ),
            );
          }),
        ],
      ),
    );
  }
}
