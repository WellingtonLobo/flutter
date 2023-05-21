import 'package:app002/data/dummy_data.dart';
import 'package:app002/screens/components/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => GridView(
        padding: EdgeInsets.all(constraints.maxHeight * .02),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories.map((cat) {
          return CategoryItem(category: cat, constraints: constraints);
        }).toList(),
      ),
    );
  }
}
