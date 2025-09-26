import 'package:flutter/material.dart';

import '../util/item_tile.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class PancakeTab extends StatelessWidget {
  // lista de pancakes
  List pancakesOnSale = [
    // [ saborPizza, precioPizza, colorPizza, nombreImagen, marcaPizza]
    [
      "Pancakes with Warm Maple Butter and Blueberries",
      "183",
      Colors.orange,
      "lib/images/classicpankace.png",
      "Clinton St. Baking Company & Restaurant"
    ],
    [
      "Banana Walnut Pancakes",
      "233",
      Colors.blue,
      "lib/images/bluberypancake.png",
      "Clinton St. Baking Company & Restaurant"
    ],
    [
      "Chocolate Chunk Pancakes",
      "242",
      Colors.pink,
      "lib/images/strawberrypancake.png",
      "Clinton St. Baking Company & Restaurant"
    ],
    [
      "Chicken & Waffles",
      "452",
      Colors.brown,
      "lib/images/nutellapankaque.png",
      "Clinton St. Baking Company & Restaurant"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakesOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return ItemTile(
          itemFlavor: pancakesOnSale[index][0],
          itemPrice: pancakesOnSale[index][1],
          itemColor: pancakesOnSale[index][2],
          imageName: pancakesOnSale[index][3],
          itembrand: pancakesOnSale[index][4],
        );
      },
    );
  }
}



