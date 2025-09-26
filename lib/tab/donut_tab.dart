import 'package:flutter/material.dart';

import '../util/item_tile.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class DonutTab extends StatelessWidget {
  // lista de donuts
  List donutsOnSale = [
    // [ saborPizza, precioPizza, colorPizza, nombreImagen, marcaPizza]
    [
      "Crème Brûlée Doughnut",
      "365",
      Colors.blue,
      "lib/images/icecream_donut.png",
      "The Doughnut Plant"
    ],
    [
      "Blueberry Bourbon Basil",
      "105",
      Colors.red,
      "lib/images/strawberry_donut.png",
      "The Doughnut Plant"
    ],
    [
      "Brooklyn Blackout",
      "271",
      Colors.purple,
      "lib/images/grape_donut.png",
      "The Doughnut Plant"
    ],
    [
      "The 24k Gold Donut",
      "15000",
      Colors.brown,
      "lib/images/chocolate_donuts.png",
      "The Doughnut Plant"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return ItemTile(
          itemFlavor: donutsOnSale[index][0],
          itemPrice: donutsOnSale[index][1],
          itemColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
          itembrand: donutsOnSale[index][4],
        );
      },
    );
  }
}
