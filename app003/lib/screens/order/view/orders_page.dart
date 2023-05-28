import 'package:app003/screens/order/resources/order_resources_string.dart';
import 'package:app003/shared/components/app_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app003/shared/components/drawer_component.dart';
import 'package:app003/screens/order/components/order_component.dart';
import 'package:app003/screens/order/model/order_list_model.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderListModel orders = Provider.of(context);

    return Scaffold(
      appBar: AppBarComponent(title: OrderResourcesString.appBarTitle),
      drawer: const DrawerComponent(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (BuildContext context, int index) =>
            OrderComponent(order: orders.items[index]),
      ),
    );
  }
}
