import 'package:flutter/material.dart';

import '../util/item_tile.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class SmoothieTab extends StatelessWidget {
  // lista de smoothies
  List smoothiesOnSale = [
    // [ saborPizza, precioPizza, colorPizza, nombreImagen, marcaPizza]
    [
      "Strawberries Wild®",
      "70",
      Colors.green,
      "lib/images/greensmoothie.png",
      "Jamba"
    ],
    [
      "Mango-A-Go-Go®",
      "92",
      Colors.red,
      "lib/images/strawberrysmoothie.png",
      "Jamba"
    ],
    [
      "Caribbean Passion®",
      "124",
      Colors.deepPurple,
      "lib/images/evilsmoothie.png",
      "Jamba"
    ],
    [
      "Razzmatazz®",
      "192",
      Colors.purple,
      "lib/images/grapesmoothie.png",
      "Jamba"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothiesOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return ItemTile(
          itemFlavor: smoothiesOnSale[index][0],
          itemPrice: smoothiesOnSale[index][1],
          itemColor: smoothiesOnSale[index][2],
          imageName: smoothiesOnSale[index][3],
          itembrand: smoothiesOnSale[index][4],
        );
      },
    );
  }
}