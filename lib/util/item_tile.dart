import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class ItemTile extends StatelessWidget {
  final String itemFlavor;
  final String itemPrice;
  final itemColor;
  final String imageName;
  final String itembrand;

  final double borderRadius = 12;

  const ItemTile({
    super.key,
    required this.itemFlavor,
    required this.itemPrice,
    required this.itemColor,
    required this.imageName,
    required this.itembrand,
  });

  @override
  Widget build(BuildContext context) {
    final Color goldColor = Colors.amber[600]!;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          // CAMBIO: Fondo a un gris muy oscuro (negro opaco)
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: goldColor, width: 2),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "\$$itemPrice",
                    style: TextStyle(
                      color: goldColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Image.asset(imageName),
              ),
            ),
            Text(
              itemFlavor,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(itembrand, style: TextStyle(color: Colors.grey[600])),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: goldColor),
                  GestureDetector(
                    onTap: () {
                      Provider.of<CartModel>(context, listen: false).addItem(
                        CartItem(
                          flavor: itemFlavor,
                          price: itemPrice,
                          color: itemColor,
                          image: imageName,
                          brand: itembrand,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$itemFlavor Added to Cart"),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Icon(Icons.add, color: goldColor, size: 28),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}