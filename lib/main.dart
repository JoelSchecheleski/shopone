import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart-provider.dart';
import 'package:shop/providers/orders-provider.dart';
import 'package:shop/providers/products-provider.dart';
import 'package:shop/utils/app-routes.dart';
import 'package:shop/views/Products-screen.dart';
import 'package:shop/views/cart-screen.dart';
import 'package:shop/views/orders-screen.dart';
import 'package:shop/views/product-detail-screen.dart';
import 'package:shop/views/product-form-screen.dart';
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
        ChangeNotifierProvider(
          create: (_) => new Orders(),
        ),

      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
//        home: ProductsOverviewScreen(),
        routes: {
          AppRoutes.HOME: (context) => ProductsOverviewScreen(),
          AppRoutes.PRODUCT_DATAIL: (context) => ProductDetailScreen(),
          AppRoutes.CART: (context) => CartScreen(),
          AppRoutes.ORDERS: (context) => OrderScreen(),
          AppRoutes.PRODUCTS: (context) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormScreen()
        },
      ),
    );
  }
}
