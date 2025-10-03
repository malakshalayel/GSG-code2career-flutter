import 'package:e_commerce_design1/features/products/presentation/provider/cart_provider.dart';
import 'package:e_commerce_design1/features/products/presentation/screens/product_detailes.dart';
import 'package:e_commerce_design1/features/products/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    this.isUsedInCart = false,
  });
  final ProductModel product;
  final isUsedInCart;
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<ProductProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailes(product: product),
          ),
        );
      },
      child: ListTile(
        leading: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(product.image)),
          ),
        ),
        title: Text(product.title),
        trailing: IconButton(
          icon: Icon(
            cartProvider.cart.contains(product)
                ? Icons.remove_circle
                : Icons.card_travel_rounded,
          ),
          onPressed: () {
            cartProvider.cart.contains(product)
                ? cartProvider.removeFromCart(product)
                : cartProvider.addToCart(product);
          },
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("\$${product.price}"),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text("${product.rating.rate}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
