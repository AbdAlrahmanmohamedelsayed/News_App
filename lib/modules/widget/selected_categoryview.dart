import 'package:flutter/material.dart';
import 'package:news_app/core/network_layer.dart';
import 'package:news_app/core/theme/colors_palettes.dart';
import 'package:news_app/model/Sources_model.dart';
import 'package:news_app/model/category_data.dart';
import 'package:news_app/modules/widget/category_view.dart';

class SelectedCategoryView extends StatefulWidget {
  final CategoryData categorydata;

  const SelectedCategoryView({super.key, required this.categorydata});

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>>(
      future: ApiManager.fetchSourceList(widget.categorydata.categoryId),
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
        List<Source> sourcesList = snapshot.data ?? [];
        return CategoryView(sourcesList: sourcesList);
      },
    );
  }
}
