import 'package:app003/screens/cart/resources/cart_resources_strings.dart';
import 'package:app003/screens/cart/resources/cart_resources_styles.dart';
import 'package:app003/shared/components/app_bar_component.dart';
import 'package:app003/shared/resources/commun_resources_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app003/screens/cart/components/cart_item_component.dart';
import 'package:app003/screens/cart/model/cart_model.dart';
import 'package:app003/screens/order/model/order_list_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartModel cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBarComponent(title: CartResourcesStrings.appBarTitle),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CartResourcesStrings.textTotal,
                    style: CartResourcesStyles.textStyleTotal,
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      CommunResourcesStrings.currencySymbol +
                          cart.totalAmount.toStringAsFixed(2),
                      style: CartResourcesStyles.currencySymbolStyle,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderListModel>(context, listen: false)
                          .addOrder(cart);
                      cart.clear();
                    },
                    child: Text(CartResourcesStrings.textBtnBuy),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) =>
                  CartItemComponent(items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
