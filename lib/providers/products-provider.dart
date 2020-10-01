import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product-model.dart';

class Products with ChangeNotifier {
  // padrão observable

  List<Product> _items = DUMMY_PRODUCTS;

  // Retorna uma cópia e não um valor original
  List<Product> get items  => [ ..._items ];
  List<Product> get favoritesItems {
    return _items.where((p) => p.isFavorite).toList();
  }

  int get itemsCount {
    return _items.length;
  }
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // Notifica todos os interessados quando uma mudança acontecer.
  }
}

//  bool _showFavoriteOnly = false;

//  List<Product> get items {
//    if (_showFavoriteOnly) {
//      return _items.where((prod) => prod.isFavorite).toList();
//    } else {
//      return [ ..._items ];
//    }
//  }

//  void  showFavoriteOnly(){
//    _showFavoriteOnly = true;
//    notifyListeners(); // Notifica todos os interessados quando uma mudança acontecer.
//  }
//
//  void  showAll(){
//    _showFavoriteOnly = false;
//    notifyListeners(); // Notifica todos os interessados quando uma mudança acontecer.
//  }