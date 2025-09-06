import 'package:e_commerce_design1/screens/products/product_detailes.dart';
import 'package:e_commerce_design1/screens/products/product_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key , required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ 
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailes(product: product)));
      },
      child: ListTile(
        leading: Container(width: 100, height: 100,
        decoration: BoxDecoration( 
          image: DecorationImage(image: NetworkImage(product.image))
        ),),
        title: Text(product.title),
        trailing: Text("\$${product.price}"),
        subtitle: Row( children: [ 
          Icon(Icons.star , color: Colors.amber,),
          Text("${product.rating.rate}"),
        ],),
      
      ),
    );
  }
}
