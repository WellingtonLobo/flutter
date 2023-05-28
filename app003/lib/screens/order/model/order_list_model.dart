import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app003/screens/cart/model/cart_model.dart';
import 'package:app003/screens/order/model/order_model.dart';

class OrderListModel with ChangeNotifier {
  final List<OrderModel> _items = [];

  List<OrderModel> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(CartModel cart) {
    _items.insert(
      0,
      OrderModel(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        date: DateTime.now(),
        products: cart.items.values.toList(),
      ),
    );

    notifyListeners();
  }
}
