import 'package:flutter/material.dart';
import 'package:news_app/data/model/Sources_model.dart';

class TabBarItem extends StatelessWidget {
  final Source source;
  final bool isSelected;

  TabBarItem({
    super.key,
    required this.source,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          color: isSelected == true ? theme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Text(source.name,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isSelected == true ? Colors.white : theme.primaryColor,
          )),
    );
  }
}
