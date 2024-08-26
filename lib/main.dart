import 'package:flutter/material.dart';
import 'package:news_app/core/config/generator_routes.dart';
import 'package:news_app/core/config/pageRoutesName.dart';
import 'package:news_app/core/theme/applecations_theme_manager.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplecationsThemeManager.lighttheme,
      title: 'News App',
      initialRoute: PageRoutesName.homepage,
      onGenerateRoute: AppRouter.onGenerator,
    );
  }
}
