import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart-provider.dart';
import 'package:shop/providers/products-provider.dart';
import 'package:shop/utils/app-routes.dart';
import 'package:shop/views/product-detail-screen.dart';
import 'package:shop/views/produts--overview-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {AppRoutes.PRODUCT_DATAIL: (context) => ProductDetailScreen()},
      ),
    );
  }
}
