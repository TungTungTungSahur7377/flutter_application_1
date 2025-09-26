// lib/pages/cart_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color goldColor = Colors.amber[600]!;
    var cart = context.watch<CartModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: goldColor),
        title: Text(
          "Your Cart",
          // CAMBIO: Título del AppBar a dorado
          style: TextStyle(color: goldColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Your Cart is Empty",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: goldColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(item.image,
                                    width: 60, height: 60, fit: BoxFit.contain),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.flavor,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "\$${item.price} each",
                                        style: TextStyle(
                                            color: goldColor, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline,
                                          color: goldColor),
                                      onPressed: () =>
                                          cart.removeSingleItem(item),
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline,
                                          color: goldColor),
                                      onPressed: () => cart.addItem(item),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // --- Sección del Total y Pago ---
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      // CAMBIO: Centrar el contenido de esta sección
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CAMBIO: Total y precio en blanco
                        Text(
                          "Total: \$${cart.totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Payment Successful!")),
                              );
                              cart.clearCart();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: goldColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            child: const Text(
                              "Pay Now",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
