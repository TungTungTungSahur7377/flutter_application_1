import 'package:flutter/material.dart';

import '../util/item_tile.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class BurgerTab extends StatelessWidget {
  // lista de burgers
  List burgersOnSale = [
    // [ saborPizza, precioPizza, colorPizza, nombreImagen, marcaPizza]
    [
      "The DB Burger",
      "135",
      Colors.yellow,
      "lib/images/cheeseburger.png",
      "The Krusty Krab"
    ],
    [
      "Black Label Burger",
      "783",
      Colors.red,
      "lib/images/baconburger.png",
      "The Krusty Krab"
    ],
    [
      "Single Cheeseburger",
      "134",
      Colors.brown,
      "lib/images/travisscottburger.png",
      "The Krusty Krab"
    ],
    [
      "Hell's Kitchen Burger",
      "352",
      Colors.pink,
      "lib/images/chikenburger.png",
      "The Krusty Krab"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return ItemTile(
          itemFlavor: burgersOnSale[index][0],
          itemPrice: burgersOnSale[index][1],
          itemColor: burgersOnSale[index][2],
          imageName: burgersOnSale[index][3],
          itembrand: burgersOnSale[index][4],
        );
      },
    );
  }
}