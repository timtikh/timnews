class ArticleModel {
  late String title;
  late String author;
  late String description;
  late String urlToImage;
  late String content;
  late String articleUrl;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.urlToImage,
      required this.articleUrl});
}
