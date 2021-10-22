import 'dart:async';
import 'package:news/helpers/const_helper.dart';
import 'package:news/models/news_model.dart';
import 'package:news/services/data_provider.dart';

class NewsState {
  bool loading;
  List<NewsModel> newsList;
  NewsState({required this.loading, required this.newsList});
}

class GetNewsEvent {
  String country;
  GetNewsEvent({required this.country});
}

class NewsBloc {
  final DataProvider _dataProvider = DataProvider();

  final _stateController = StreamController<NewsState>();
  final _eventsController = StreamController<GetNewsEvent>();

  Stream<NewsState> get state => _stateController.stream;
  Sink<GetNewsEvent> get action => _eventsController.sink;

  int index = 0;

  NewsBloc() {
    _eventsController.stream.listen(_handleEvents);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  Future<void> _handleEvents(GetNewsEvent action) async {
    index = ConstHelper.cities.keys.toList().indexOf(action.country);
    _stateController.add(NewsState(loading: true, newsList: []));
    List<NewsModel> _newsList = await _dataProvider.getNews(action.country);
    _stateController.add(NewsState(loading: false, newsList: _newsList));
  }
}
