import 'package:app002/models/meal_model.dart';
import 'package:app002/screens/components/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<MealModel> favoriteMeals;
  const FavoriteScreen({required this.favoriteMeals, super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text("My favorites meal"),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (BuildContext context, int index) {
              return MealItem(
                meal: favoriteMeals[index],
              );
            },
          );
  }
}
