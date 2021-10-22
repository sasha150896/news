class NewsModel {
  String source = "";
  String author = "";
  String title = "";
  String description = "";
  String url = "";
  String urlToImage = "";
  String publishedAt = "";

  NewsModel.fromMap(Map json) {
    source = json["source"]["name"] ?? "";
    title = json["title"] ?? "";
    description = json["description"] ?? "";
    url = json["url"] ?? "";
    urlToImage = json["urlToImage"] ?? "";
    publishedAt = json["publishedAt"] ?? "";
  }
}