import 'package:app002/models/meal_model.dart';
import 'package:app002/screens/categories_screen.dart';
import 'package:app002/screens/components/menu_drawer.dart';
import 'package:app002/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;
  const TabsScreen({required this.favoriteMeals, super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> screens;
  @override
  void initState() {
    screens = [
      const CategoriesScreen(),
      FavoriteScreen(favoriteMeals: widget.favoriteMeals),
    ];
    super.initState();
  }

  int selectScreenIndex = 0;

  selectScreen(int index) {
    setState(() {
      selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              selectScreenIndex == 0 ? "Minhas Categorias" : "Meus Favoritos"),
          centerTitle: true,
        ),
        body: screens[selectScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectScreenIndex,
          type: BottomNavigationBarType.fixed,
          onTap: selectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categorias",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoritos",
            ),
          ],
        ),
        drawer: const MenuDrawer(),
      ),
    );
  }
}
