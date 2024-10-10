import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount {
    return _items.fold(
        0.0, (total, item) => total + (item.price * item.quantity));
  }

  void addItem(CartItem newItem) {
    final existingItemIndex =
        _items.indexWhere((item) => item.productId == newItem.productId);

    if (existingItemIndex >= 0) {
      // Item already in cart, update quantity
      _items[existingItemIndex].quantity += newItem.quantity;
    } else {
      // Add new item to cart
      _items.add(newItem);
    }
    notifyListeners(); // Notify listeners about the change
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.productId == productId);
    notifyListeners(); // Notify listeners about the change
  }

  void incrementQuantity(String productId) {
    final existingItemIndex =
        _items.indexWhere((item) => item.productId == productId);
    if (existingItemIndex >= 0) {
      _items[existingItemIndex].quantity++;
      notifyListeners(); // Notify listeners about the change
    }
  }

  void decrementQuantity(String productId) {
    final existingItemIndex =
        _items.indexWhere((item) => item.productId == productId);
    if (existingItemIndex >= 0) {
      if (_items[existingItemIndex].quantity > 1) {
        _items[existingItemIndex].quantity--;
      } else {
        _items.removeAt(existingItemIndex); // Remove item if quantity is 0
      }
      notifyListeners(); // Notify listeners about the change
    }
  }
}
