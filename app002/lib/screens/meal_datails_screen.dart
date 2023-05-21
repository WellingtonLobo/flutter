import 'package:app002/models/meal_model.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function(MealModel) onToggleFavorite;
  const MealDetailsScreen({required this.onToggleFavorite, super.key});

  Widget createSectionTitle(
      {required BuildContext context, required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget createSectionContainer({required Widget widget}) {
    return Container(
      width: 350,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          createSectionTitle(title: "Ingredientes", context: context),
          createSectionContainer(
            widget: ListView.builder(
              shrinkWrap: true,
              itemCount: meal.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Text(
                    meal.ingredients[index],
                  ),
                );
              },
            ),
          ),
          createSectionTitle(title: "Passos", context: context),
          createSectionContainer(
            widget: ListView.builder(
              shrinkWrap: true,
              itemCount: meal.steps.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                    )
                  ],
                );
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: meal.isFavorite
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey,
        onPressed: () {
          onToggleFavorite(meal);
          meal.isFavorite = !meal.isFavorite;
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
