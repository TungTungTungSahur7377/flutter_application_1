// lib/model/cart_model.dart
// REEMPLAZA TODO TU ARCHIVO CON ESTE CÓDIGO

import 'package:flutter/material.dart';

class CartItem {
  final String flavor;
  final String price;
  final Color color;
  final String image;
  final String brand;
  int quantity; // <-- 1. AÑADIMOS LA CANTIDAD

  CartItem({
    required this.flavor,
    required this.price,
    required this.color,
    required this.image,
    required this.brand,
    this.quantity = 1, // Por defecto la cantidad es 1
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // 2. LÓGICA DE AÑADIR/INCREMENTAR ACTUALIZADA
  void addItem(CartItem item) {
    // Revisa si el item ya existe usando su 'flavor' como ID único
    final index = _items.indexWhere((i) => i.flavor == item.flavor);

    if (index != -1) {
      // Si ya existe, solo incrementa la cantidad
      _items[index].quantity++;
    } else {
      // Si es nuevo, lo añade a la lista
      _items.add(item);
    }
    notifyListeners();
  }

  // 3. NUEVA FUNCIÓN PARA RESTAR O ELIMINAR
  void removeSingleItem(CartItem item) {
    final index = _items.indexWhere((i) => i.flavor == item.flavor);

    if (index != -1) {
      if (_items[index].quantity > 1) {
        // Si hay más de uno, solo reduce la cantidad
        _items[index].quantity--;
      } else {
        // Si solo queda uno, lo elimina de la lista
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  // Función para eliminar todas las unidades de un item (para un botón de basura opcional)
  void removeItemCompletely(CartItem item) {
    _items.removeWhere((i) => i.flavor == item.flavor);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // 4. CÁLCULO DEL PRECIO TOTAL ACTUALIZADO
  double get totalPrice {
    return _items.fold(
        0, (sum, item) => sum + (double.parse(item.price) * item.quantity));
  }
}