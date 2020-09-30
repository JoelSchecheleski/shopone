import 'package:flutter/material.dart';
import 'package:shop/providers/product-model.dart';

class ProductDetailScreen extends StatelessWidget {
//  ProductDetailScreen({this.product});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
