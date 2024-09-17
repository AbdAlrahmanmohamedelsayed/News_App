import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_data.dart';

class ItemData extends StatelessWidget {
  final int index;
  final CategoryData categoryitem;
  final void Function(CategoryData) onCategoryClicked;
  const ItemData(
      {super.key,
      required this.onCategoryClicked,
      required this.categoryitem,
      required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        onCategoryClicked(categoryitem);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: categoryitem.categorybackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomRight: index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(25),
            )),
        child: Column(
          children: [
            Expanded(child: Image.asset(categoryitem.categoryImage)),
            Text(
              categoryitem.categoryName,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
