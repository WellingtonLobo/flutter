import 'package:app002/data/dummy_data.dart';
import 'package:app002/models/meal_model.dart';
import 'package:app002/models/setting_model.dart';
import 'package:app002/screens/categories_meals_screen.dart';
import 'package:app002/screens/categories_screen.dart';
import 'package:app002/screens/components/tabs_screen.dart';
import 'package:app002/screens/meal_datails_screen.dart';
import 'package:app002/screens/settings_screen.dart';
import 'package:app002/utils/app_routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MealModel> avaibleMeals = dummyMeals;
  List<MealModel> favoriteMeals = <MealModel>[];
  SettingModel setSettings = SettingModel();

  Future<void> applySettings(SettingModel setting) async {
    setState(() {
      setSettings = setting;
      avaibleMeals = dummyMeals.where((m) {
        final filterGluten = setting.isGlutenFree! && !m.isGlutenFree;
        final filterLactose = setting.isLactoseFree! && !m.isLactoseFree;
        final filterVegan = setting.isVegan! && !m.isVegan;
        final filterVegeterian = setting.isVegetarian! && !m.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegeterian;
      }).toList();
    });
  }

  Future<void> toggleFavorite(MealModel meal) async {
    setState(() {
      favoriteMeals.contains(meal)
          ? favoriteMeals.remove(meal)
          : favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromRGBO(255, 254, 229, 1),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.indigo,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            selectedIconTheme: IconThemeData(color: Colors.redAccent, size: 25),
            unselectedIconTheme:
                IconThemeData(color: Colors.blueGrey, size: 25),
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelStyle: TextStyle(color: Colors.blueGrey)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.indigo,
          secondary: Colors.redAccent,
        ),
        fontFamily: 'Releway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRouters.home: (context) => TabsScreen(favoriteMeals: favoriteMeals),
        AppRouters.categoriesMeals: (context) =>
            CategoriesMealsScreen(meals: avaibleMeals),
        AppRouters.mealDetails: (context) =>
            MealDetailsScreen(onToggleFavorite: toggleFavorite),
        AppRouters.settings: (context) => SettingsScreen(
            onSettingsChange: applySettings, settings: setSettings)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      },
    );
  }
}
