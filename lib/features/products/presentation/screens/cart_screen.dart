import 'package:e_commerce_design1/features/products/presentation/provider/cart_provider.dart';
import 'package:e_commerce_design1/features/products/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Center(
        child:
            cartProvider.cart.isEmpty
                ? Text('No Items in Cart')
                : ListView.builder(
                  itemCount: cartProvider.cart.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      product: cartProvider.cart[index],
                      isUsedInCart: true,
                    );
                  },
                ),
      ),
    );
  }
}
