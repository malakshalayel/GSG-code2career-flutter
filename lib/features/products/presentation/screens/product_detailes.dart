import 'package:e_commerce_design1/features/products/data/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailes extends StatelessWidget {
  const ProductDetailes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(product.image)),
            ),
          ),
          Text(product.title),
          Text("\$${product.price}"),
          Text(product.description),
          Text(product.category),
          Text(product.rating.rate.toString()),
          Text(product.rating.count.toString()),
        ],
      ),
    );
  }
}
