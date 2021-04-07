import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_news_app/model/article.dart';
import 'package:mvvm_news_app/viewmodel/article_detail_viewmodel.dart';
import 'package:provider/provider.dart';

class ArticleDetail extends StatefulWidget {
  ArticleDetail({Key key}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  Future<void> getDataFromPreviousPage() async {
    Article article = await ModalRoute.of(context).settings.arguments;
    Provider.of<ArticleDetailViewModel>(context, listen: false).article =
        article;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: FutureBuilder(
        future: getDataFromPreviousPage(),
        builder: (_, __) => _buildBody(),
      ),
      backgroundColor: Color.fromRGBO(31, 29, 46, 1),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 80.0,
    );
  }

  Widget _buildBody() {
    Article article =
        Provider.of<ArticleDetailViewModel>(context, listen: false).article;
    if (article == null) {
      return Center(child: Text("Error"));
    }
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: <Widget>[
            _buildAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  article.urlToImage != null
                      ? Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            image: DecorationImage(
                                image: NetworkImage(
                                  article.urlToImage,
                                ),
                                fit: BoxFit.cover),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_pin_circle_sharp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(article.author,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(article.publishedAt,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(article.title,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(height: 10),
                  Text(article.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 999,
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.normal,
                          fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
