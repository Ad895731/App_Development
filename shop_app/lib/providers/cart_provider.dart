import 'package:flutter/material.dart';

// this CartProvider is store house which we talking about in widget tree
class CartProvider
    extends /*with can be used as it is ChangeNotifier is  mixin class*/
        ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    //notifyListeners is used to notify all the listeners that the cart has been updated
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
