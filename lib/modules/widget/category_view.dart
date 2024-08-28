import 'package:flutter/material.dart';
import 'package:news_app/core/network_layer.dart';
import 'package:news_app/core/theme/colors_palettes.dart';
import 'package:news_app/model/Sources_model.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/modules/widget/item_article_view.dart';
import 'package:news_app/modules/widget/tab_bar.dart';

class CategoryView extends StatefulWidget {
  final List<Source> sourcesList;

  CategoryView({super.key, required this.sourcesList});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
                dividerColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                indicatorPadding: EdgeInsets.zero,
                indicator: const BoxDecoration(),
                isScrollable: true,
                onTap: (value) {
                  setState(() {
                    selectedIndexTab = value;
                  });
                },
                tabs: widget.sourcesList
                    .map(
                      (e) => TabBarItem(
                        isSelected:
                            selectedIndexTab == widget.sourcesList.indexOf(e),
                        source: e,
                      ),
                    )
                    .toList())),
        Container(
          child: FutureBuilder<List<Article>>(
            future: ApiManager.fetchArticleList(
                widget.sourcesList[selectedIndexTab].id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text('Error Fetch');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsPalettes.primaryColor,
                  ),
                );
              }

              final List<Article> ArticlesList = snapshot.data ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: ArticlesList.length,
                  itemBuilder: (context, index) {
                    Article article = ArticlesList[index];
                    return ItemArticleView(
                      article: article,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
