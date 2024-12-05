import 'package:flutter/material.dart';
import 'package:exam_api/model/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<NewsModel> _favorites = [];

  List<NewsModel> get favorites => _favorites;

  void toggleFavorite(NewsModel news) {
    if (_favorites.contains(news)) {
      _favorites.remove(news);
    } else {
      _favorites.add(news);
    }
    notifyListeners();
  }

  bool isFavorite(NewsModel news) {
    return _favorites.contains(news);
  }
}
