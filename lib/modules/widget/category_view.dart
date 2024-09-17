import 'package:flutter/material.dart';

import 'package:news_app/data/model/Sources_model.dart';
import 'package:news_app/data/model/articles_model.dart';
import 'package:news_app/modules/view_model/articles_view_model.dart';
import 'package:news_app/modules/widget/item_article_view.dart';
import 'package:news_app/modules/widget/tab_bar.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  final List<Source> sourcesList;

  CategoryView({super.key, required this.sourcesList});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late ArticlesViewModel _articlesViewModel;

  int selectedIndexTab = 0;
  @override
  void initState() {
    _articlesViewModel = ArticlesViewModel();
    super.initState();
  }

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
                  _articlesViewModel
                    ..getArticleList(widget.sourcesList[selectedIndexTab].id);
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
        ChangeNotifierProvider(
          create: (context) => _articlesViewModel
            ..getArticleList(widget.sourcesList[selectedIndexTab].id),
          child: Consumer<ArticlesViewModel>(
            builder: (context, vm, _) {
              return Expanded(
                child: ListView.builder(
                  itemCount: vm.articlesList.length,
                  itemBuilder: (context, index) {
                    Article article = vm.articlesList[index];
                    return ItemArticleView(
                      article: article,
                    );
                  },
                ),
              );
            },
          ),
        ),
        // FutureBuilder<List<Article>>(
        //   future: ApiManager.fetchArticleList(
        //       widget.sourcesList[selectedIndexTab].id),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     print(widget.sourcesList[selectedIndexTab].id);
        //     if (snapshot.hasError) {
        //       return const Text('Error Fetch');
        //     }
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: ColorsPalettes.primaryColor,
        //         ),
        //       );
        //     }
        //     final List<Article> articlesList = snapshot.data ?? [];
        //     return Expanded(
        //       child: ListView.builder(
        //         itemCount: articlesList.length,
        //         itemBuilder: (context, index) {
        //           Article article = articlesList[index];
        //           return ItemArticleView(
        //             article: article,
        //           );
        //         },
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
