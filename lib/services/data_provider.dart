import 'dart:developer';
import 'package:news/models/news_model.dart';
import 'api_router.dart';

class DataProvider {
  Future<List<NewsModel>> getNews(String country) async {
    List<NewsModel> _newsList = [];

    try {
      var response =
          await ApiRouter.sendRequest(requestParams: {"country": country});
      response["articles"].forEach((element) {
        _newsList.add(NewsModel.fromMap(element));
      });
    } catch (e) {
      log(e.toString());
    }

    return _newsList;
  }
}
