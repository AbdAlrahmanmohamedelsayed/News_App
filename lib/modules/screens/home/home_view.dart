import 'package:flutter/material.dart';
import 'package:news_app/model/category_data.dart';
import 'package:news_app/modules/widget/custom%20_drawer.dart';
import 'package:news_app/modules/widget/item_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryData> categoryDataList = [
    CategoryData(
        categoryId: 'sports',
        categoryName: 'Sports',
        categoryImage: 'assets/images/ball.png',
        categorybackgroundColor: const Color(0xffC91C22)),
    CategoryData(
        categoryId: 'politics',
        categoryName: 'Politics',
        categoryImage: 'assets/images/Politics.png',
        categorybackgroundColor: const Color(0xff003E90)),
    CategoryData(
        categoryId: 'health',
        categoryName: 'Health',
        categoryImage: 'assets/images/health.png',
        categorybackgroundColor: const Color(0xffED1E79)),
    CategoryData(
        categoryId: 'business',
        categoryName: 'Business',
        categoryImage: 'assets/images/bussines.png',
        categorybackgroundColor: const Color(0xffCF7E48)),
    CategoryData(
        categoryId: 'enviroment',
        categoryName: 'Enviroment',
        categoryImage: 'assets/images/environment.png',
        categorybackgroundColor: const Color(0xff4882CF)),
    CategoryData(
        categoryId: 'science',
        categoryName: 'Science',
        categoryImage: 'assets/images/science.png',
        categorybackgroundColor: const Color(0xffF2D352)),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png')),
          color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          'News App',
        )),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick your category \nof interest',
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: const Color(0xff4F5A69)),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) => ItemData(
                    Categoryitem: categoryDataList[index],
                    index: index,
                  ),
                  itemCount: categoryDataList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
