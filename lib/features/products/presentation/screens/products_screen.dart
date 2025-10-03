import 'package:e_commerce_design1/features/products/presentation/provider/cart_provider.dart';
import 'package:e_commerce_design1/features/products/presentation/screens/all_products.dart';
import 'package:e_commerce_design1/features/products/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int index = 0;

  // Create screens list as a getter that builds on demand
  List<Widget> get screens => [
    ProductListView(), // Separate widget for product list
    Cart(),
    Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Main App"),
        actions: [
          Badge.count(
            count: productProvider.cart.length,
            child: IconButton(
              icon: Icon(Icons.card_travel),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
            ),
          ),
        ],
      ),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2_outlined),
            label: "Cart",
            activeIcon: Icon(Icons.shop_2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            activeIcon: Icon(Icons.settings_cell_outlined),
          ),
        ],
      ),
    );
  }
}

// Separate widget for the product list content
