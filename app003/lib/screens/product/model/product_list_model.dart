import 'package:flutter/material.dart';
import 'package:app003/data/dummy_data.dart';
import 'package:app003/screens/product/model/product_model.dart';

class ProductListModel with ChangeNotifier {
  final List<ProductModel> _items = dummyProducts;

  List<ProductModel> get items => [..._items];
  List<ProductModel> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  void addProduct(ProductModel product) {
    _items.add(product);
    notifyListeners();
  }
}
