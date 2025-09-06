import 'dart:convert';

import 'package:e_commerce_design1/screens/products/product_model.dart';
import 'package:e_commerce_design1/screens/products/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:developer';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int index = 0;
  List<Widget> screens = [Text("Home"), Text("cart"), Text("settings")];
  List<ProductModel> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main App")),
      body: Center(
        child:
            isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductWidget(product: product);
                  },
                ),
      ),
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

  fetchData() async {
    try {
      final response = await get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      log(response.body);
      var data = jsonDecode(response.body);
      products = (data as List).map((e) => ProductModel.fromJson(e)).toList();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      log('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }
}
