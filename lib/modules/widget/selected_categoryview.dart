import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palettes.dart';
import 'package:news_app/data/model/category_data.dart';
import 'package:news_app/modules/view_model/sources_view_model.dart';
import 'package:news_app/modules/widget/category_view.dart';
import 'package:provider/provider.dart';

class SelectedCategoryView extends StatelessWidget {
  final CategoryData categorydata;

  const SelectedCategoryView({super.key, required this.categorydata});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          SourcesViewModel()..getSourcesList(categorydata.categoryId),
      child: Consumer<SourcesViewModel>(
        builder: (context, vm, _) {
          if (vm.sourcesList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsPalettes.primaryColor,
              ),
            );
          }
          return CategoryView(sourcesList: vm.sourcesList);
        },
      ),
    );
    // return FutureBuilder<List<Source>>(
    //   future: ApiManager.fetchSourceList(widget.categorydata.categoryId),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
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
    //     List<Source> sourcesList = snapshot.data ?? [];
    //     return CategoryView(sourcesList: sourcesList);
    //   },
    // );
  }
}
