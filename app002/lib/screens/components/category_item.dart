import 'package:app002/models/category_model.dart';
import 'package:app002/utils/app_routers.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final BoxConstraints constraints;

  const CategoryItem(
      {required this.category, required this.constraints, super.key});

  Future<void> selectCategory({required BuildContext context}) async =>
      Navigator.of(context)
          .pushNamed(AppRouters.categoriesMeals, arguments: category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context: context),
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(constraints.maxHeight * .015),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(.5),
                category.color,
              ],
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Text(category.title),
      ),
    );
  }
}
