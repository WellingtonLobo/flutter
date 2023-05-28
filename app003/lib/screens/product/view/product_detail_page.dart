import 'package:app003/screens/product/resources/product_resources_styles.dart';
import 'package:app003/shared/components/app_bar_component.dart';
import 'package:app003/shared/resources/commun_resources_strings.dart';
import 'package:flutter/material.dart';
import 'package:app003/screens/product/model/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBarComponent(title: product.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(
              '${CommunResourcesStrings.currencySymbol} ${product.price}',
              style: ProductResourcesStyle.productPriceStyle,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(product.description, textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
