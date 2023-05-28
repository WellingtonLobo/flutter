import 'package:app003/screens/cart/model/cart_model.dart';
import 'package:app003/screens/home/resources/home_resources_string.dart';
import 'package:app003/screens/product/components/product_grid_component.dart';
import 'package:app003/shared/components/app_bar_component.dart';
import 'package:app003/shared/components/badge_component.dart';
import 'package:app003/shared/components/drawer_component.dart';
import 'package:app003/shared/models/enum_filter_options.dart';
import 'package:app003/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: HomeResourcesString.appBarTitle,
        enabledAction: true,
        actions: [
          Consumer<CartModel>(
            child: IconButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.cart),
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (BuildContext context, CartModel cart, child) =>
                BadgeComponent(
                    value: cart.itemsCount.toString(), child: child!),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  value: FilterOptions.favorite,
                  child: Text(HomeResourcesString.textFavoriteOnly)),
              PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text(HomeResourcesString.textAll)),
            ],
            onSelected: (FilterOptions selectedValue) => setState(() =>
                selectedValue == FilterOptions.favorite
                    ? _showFavoriteOnly = true
                    : _showFavoriteOnly = false),
          ),
        ],
      ),
      body: ProductGridComponent(_showFavoriteOnly),
      drawer: const DrawerComponent(),
    );
  }
}
