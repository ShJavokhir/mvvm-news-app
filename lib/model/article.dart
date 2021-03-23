class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        author: json['author'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        url: json['url'],
        publishedAt: json['publishedAt']);
  }
}
