import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app003/screens/cart/model/cart_model.dart';
import 'package:app003/screens/order/model/order_list_model.dart';
import 'package:app003/screens/product/model/product_list_model.dart';
import 'package:app003/screens/cart/view/cart_page.dart';
import 'package:app003/screens/order/view/orders_page.dart';
import 'package:app003/screens/product/view/product_detail_page.dart';
import 'package:app003/screens/home/view/home_page.dart';
import 'package:app003/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductListModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderListModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.home: (ctx) => const HomePage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
