import 'package:flutter/material.dart';
import 'package:news_app/model/articles_model.dart';

// ignore: must_be_immutable
class ItemArticleView extends StatelessWidget {
  Article article;
  ItemArticleView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: theme.primaryColor)),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          article.urlToImage.isEmpty
              ? Image.asset('assets/images/notfound.jpeg')
              : Image.network(
                  article.urlToImage,
                  fit: BoxFit.fitHeight,
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.name,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xff79828B),
                ),
              ),
              Text(
                article.title,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: const Color(0xff42505C)),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  article.publishedAt,
                  textAlign: TextAlign.end,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xff79828B),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
