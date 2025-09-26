import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/my_tab.dart';

import '../tab/burger_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/pancake_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/smoothie_tab.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // my tabs
  List<Widget> myTabs = const [
    //donut tab
    MyTab(
      iconPath: "lib/icons/donut.png",
    ),
    //burger tab
    MyTab(
      iconPath: "lib/icons/burguer.png",
    ),
    //smoothie tab
    MyTab(
      iconPath: "lib/icons/smothie.png",
    ),
    //pancake tab
    MyTab(
      iconPath: "lib/icons/pancakes.png",
    ),
    //pizza tab
    MyTab(
      iconPath: "lib/icons/pizza.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Define el color dorado para reutilizarlo
    final Color goldColor = Colors.amber[600]!;

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: goldColor,
                size: 36,
              ),
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: goldColor,
                  size: 36,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(Icons.shopping_cart, size: 36, color: goldColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                children: [
                  const Text(
                    "The Highest Quality ",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    "FOOD",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: goldColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TabBar(
              tabs: myTabs,
              // ANTERIOR: indicatorColor: goldColor,

              // CAMBIO: Usamos 'indicator' para decorar el fondo de la pestaña activa
              indicator: BoxDecoration(
                color: goldColor,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakeTab(),
                  PizzaTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}