import 'package:app003/screens/order/model/order_model.dart';
import 'package:app003/screens/order/resources/order_resources_style.dart';
import 'package:app003/shared/resources/commun_resources_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderComponent extends StatefulWidget {
  final OrderModel order;

  const OrderComponent({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderComponent> createState() => _OrderComponentState();
}

class _OrderComponentState extends State<OrderComponent> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(CommunResourcesStrings.currencySymbol +
                widget.order.total.toStringAsFixed(2)),
            subtitle: Text(
              DateFormat(CommunResourcesStrings.modelDateTime)
                  .format(widget.order.date),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () => setState(() => _expanded = !_expanded),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: (widget.order.products.length * 24) + 10,
              child: ListView(
                children: widget.order.products
                    .map(
                      (product) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: OrderResourcesStyle.productNameStyle,
                          ),
                          Text(
                            '${product.quantity}x ${CommunResourcesStrings.currencySymbol} ${product.price}',
                            style: OrderResourcesStyle.productQttyStyle,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
