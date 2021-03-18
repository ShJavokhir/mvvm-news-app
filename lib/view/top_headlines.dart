import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopHeadlines extends StatefulWidget {
  TopHeadlines({Key key}) : super(key: key);

  @override
  _TopHeadlinesState createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: Container(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        getAppBar(),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: CustomScrollView(
              slivers: [
                SliverGrid(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15),
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return newsCardView();
                    },
                    childCount: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getAppBar() {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(255, 255, 255, 1),
        Color.fromRGBO(255, 255, 255, 0.5)
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Container(
      padding: EdgeInsets.only(left: 15),
      alignment: Alignment.centerLeft,
      height: 150,
      width: double.infinity,
      child: SafeArea(
        child: Text(
          "Recent news",
          style: TextStyle(
              fontFamily: "AlfaSlabOne",
              fontSize: 30,
              foreground: Paint()..shader = linearGradient),
        ),
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(55, 49, 103, 1),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0)),
      ),
    );
  }

  Widget newsCardView() {
    const width = 60.0;
    const height = 120.0;
    return Container(
      padding: EdgeInsets.all(10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        border: Border.all(color: Color.fromRGBO(55, 49, 103, 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 5.0),
            blurRadius: 10.0,
          ),
        ],
      ),
    );
  }
}
