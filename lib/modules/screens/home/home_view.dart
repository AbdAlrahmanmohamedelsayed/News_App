import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_data.dart';
import 'package:news_app/modules/widget/custom%20_drawer.dart';
import 'package:news_app/modules/widget/item_data.dart';
import 'package:news_app/modules/widget/selected_categoryview.dart';

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
        categoryId: 'technology',
        categoryName: 'Technology',
        categoryImage: 'assets/images/tecnology.png',
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
        categoryId: 'entertainment',
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
            actions: [
              selectedCategoryData != null
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 33,
                      ))
                  : SizedBox()
            ],
            title: Text(
              selectedCategoryData == null
                  ? 'News App'
                  : selectedCategoryData!.categoryName,
            )),
        drawer: CustomDrawer(
          onCategoryClicked: categoryDrawerClick,
        ),
        body: selectedCategoryData == null
            ? Padding(
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index) => ItemData(
                          onCategoryClicked: categoryDataClick,
                          categoryitem: categoryDataList[index],
                          index: index,
                        ),
                        itemCount: categoryDataList.length,
                      ),
                    )
                  ],
                ),
              )
            : SelectedCategoryView(
                categorydata: selectedCategoryData!,
              ),
      ),
    );
  }

  CategoryData? selectedCategoryData;
  void categoryDataClick(CategoryData data) {
    setState(() {
      selectedCategoryData = data;
    });
  }

  void categoryDrawerClick() {
    setState(() {
      selectedCategoryData = null;
    });
    Navigator.pop(context);
  }
}
