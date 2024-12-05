import 'package:exam_api/screen/detailscreen/detail_page.dart';
import 'package:exam_api/screen/favoritescreen/favorite_page.dart';
import 'package:exam_api/screen/homepage/homepage.dart';
import 'package:exam_api/screen/spleshscreen/spleshscreen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static String spleshscreen = '/';
  static String homescreen = 'home_screen';
  static String detailscreen = 'detail_screen';
  static String favoritesreen = 'favorite_screen';

  static Map<String, WidgetBuilder> myRoutes = {
    spleshscreen: (ctx) => const SplashScreen(),
    homescreen: (ctx) => const Homepage(),
    detailscreen: (ctx) => const DetailScreen(),
    favoritesreen: (ctx) => const FavoritesPage(),
  };
}
