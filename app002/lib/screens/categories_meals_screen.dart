import 'package:app002/models/category_model.dart';
import 'package:app002/models/meal_model.dart';
import 'package:app002/screens/components/meal_item.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<MealModel> meals;
  const CategoriesMealsScreen({required this.meals, super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final catergoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: catergoryMeals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealItem(meal: catergoryMeals[index]);
          }),
    );
  }
}
