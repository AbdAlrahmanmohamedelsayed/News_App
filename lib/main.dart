import 'package:flutter/material.dart';
import 'package:news_app/core/config/generator_routes.dart';
import 'package:news_app/core/config/pageRoutesName.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRouter.onGenerator,
    );
  }
}
