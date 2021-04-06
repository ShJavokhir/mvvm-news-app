import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_news_app/model/article.dart';
import 'package:mvvm_news_app/services/news_api_webservice.dart';
import 'package:mvvm_news_app/viewmodel/top_headlines_viewmodel.dart';
import 'package:provider/provider.dart';

class TopHeadlines extends StatefulWidget {
  TopHeadlines({Key key}) : super(key: key);

  @override
  _TopHeadlinesState createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  @override
  void initState() {
    //Future delayed zero is just for getting context. Bcz you know that we can not access context in initstate directly
    Future.delayed(Duration.zero).then((_) {
      Provider.of<TopHeadlinesViewModel>(context, listen: false)
          .fetchTopHeadlines(context);
    });
    //NewsApiWebService().fetchTopHeadlines();
    super.initState();
  }

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
    return Consumer<TopHeadlinesViewModel>(builder: (_, viewmodel, child) {
      return Column(
        children: [
          _getAppBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(0),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.714,
                    ),
                    delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _newsCardView(viewmodel.articles[index]);
                      },
                      childCount: viewmodel.articles.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _getAppBar() {
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

  Widget _newsCardView(Article article) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: article.urlToImage != null
            ? DecorationImage(
                image: NetworkImage(
                  article.urlToImage,
                ),
                fit: BoxFit.cover)
            : null,
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
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 130),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        article.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.account_circle_rounded,
                              color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              article.author != null ? article.author : "none",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
