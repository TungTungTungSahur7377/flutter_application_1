import 'package:flutter/material.dart';

import '../util/item_tile.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class PizzaTab extends StatelessWidget {
  // Lista de pizzas a la venta
  List pizzasOnSale = [
    // [ saborPizza, precioPizza, colorPizza, nombreImagen, marcaPizza]
    [
      "Futuro di Marinara",
      "143",
      Colors.red,
      "lib/images/peperonipizza.png",
      "I Masanielli - Francesco Martucci"
    ],
    [
      "La Mano di D10S",
      "287",
      Colors.yellow,
      "lib/images/funguspizza.png",
      "I Masanielli - Francesco Martucci"
    ],
    [
      "Prosciutto e Fichi",
      "196",
      Colors.green,
      "lib/images/vegepizza.png",
      "I Masanielli - Francesco Martucci"
    ],
    [
      "Margherita",
      "231",
      Colors.brown,
      "lib/images/doncangrejopizza.png",
      "I Masanielli - Francesco Martucci"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzasOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return ItemTile(
          itemFlavor: pizzasOnSale[index][0],
          itemPrice: pizzasOnSale[index][1],
          itemColor: pizzasOnSale[index][2],
          imageName: pizzasOnSale[index][3],
          itembrand: pizzasOnSale[index][4],
        );
      },
    );
  }
}
