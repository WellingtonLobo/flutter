import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app003/screens/product/components/product_item_component.dart';
import 'package:app003/screens/product/model/product_model.dart';
import 'package:app003/screens/product/model/product_list_model.dart';

class ProductGridComponent extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGridComponent(this.showFavoriteOnly, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductListModel>(context);
    final List<ProductModel> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (BuildContext context, int index) =>
          ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: const ProductItemComponent(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
