import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app003/screens/cart/model/cart_model.dart';
import 'package:app003/screens/product/model/product_model.dart';
import 'package:app003/utils/app_routes.dart';

class ProductItemComponent extends StatelessWidget {
  const ProductItemComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context, listen: false);
    final cart = Provider.of<CartModel>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<ProductModel>(
            builder: (BuildContext context, ProductModel product, _) =>
                IconButton(
              onPressed: () => product.toggleFavorite(),
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(product.name, textAlign: TextAlign.center),
          trailing: IconButton(
            onPressed: () => cart.addItem(product),
            icon: const Icon(Icons.add_shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
          onTap: () => Navigator.of(context)
              .pushNamed(AppRoutes.productDetail, arguments: product),
        ),
      ),
    );
  }
}
