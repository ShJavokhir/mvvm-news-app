//started at 16:20 march 17 2021
import 'package:flutter/material.dart';
import 'package:mvvm_news_app/view/splash_screen.dart';
import 'package:mvvm_news_app/view/top_headlines.dart';
import 'package:mvvm_news_app/viewmodel/splash_screen_viewmodel.dart';
import 'package:mvvm_news_app/viewmodel/top_headlines_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(brightness: Brightness.light),
      ),
      initialRoute: "/topHeadlines",
      routes: {
        // "/": (_) {
        //   return ChangeNotifierProvider(
        //     create: (_) => SplashScreenViewModel(),
        //     child: SplashScreen(),
        //   );
        // },
        "/topHeadlines": (_) {
          return ChangeNotifierProvider(
            create: (_) => TopHeadlinesViewModel(),
            child: TopHeadlines(),
          );
        },
      },
    );
  }
}
