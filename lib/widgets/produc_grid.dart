import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products-provider.dart';
import 'package:shop/widgets/prroduct_item.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavoriteOnly;

  ProductGrid({this.showFavoriteOnly});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products = showFavoriteOnly ? productsProvider.favoritesItems : productsProvider.items;


    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // Quando já existir um Change Nofifier mixin então  deve ser usado o value
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
