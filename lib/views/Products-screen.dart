import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products-provider.dart';
import 'package:shop/utils/app-routes.dart';
import 'package:shop/views/app-drawer.dart';
import 'package:shop/widgets/product-item.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItem(
                product: products[i],
              ),
              Divider(),
            ],
          )
        ),
      ),
    );
  }
}
