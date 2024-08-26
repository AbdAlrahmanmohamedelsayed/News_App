import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palettes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
        color: Colors.white,
        width: mediaQuery.size.width * .7,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: ColorsPalettes.primaryColor,
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * .2,
              child: Text(
                'News App 📰',
                style: theme.textTheme.bodyLarge,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Categories',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Settings',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
