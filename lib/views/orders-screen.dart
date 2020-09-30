import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders-provider.dart';
import 'package:shop/views/app-drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
      ),
    );
  }
}
