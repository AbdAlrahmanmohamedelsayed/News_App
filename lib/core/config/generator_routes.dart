import 'package:flutter/material.dart';
import 'package:news_app/core/config/pageRoutesName.dart';
import 'package:news_app/modules/screens/splash/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: settings);
    }
  }
}
