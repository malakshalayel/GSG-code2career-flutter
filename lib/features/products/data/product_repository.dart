import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce_design1/features/products/data/product_model.dart';
import 'package:http/http.dart';

class ProductRepository {
  List<ProductModel> products = [];
  static Future<List<ProductModel>> fetchProduct() async {
    List<ProductModel> products = [];

    try {
      final response = await get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      log(response.body);
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> map in data) {
        ProductModel model = ProductModel.fromJson(map);
        products.add(model);
      }
      log('Fetched ${products.length} products');
    } catch (e) {
      log('Error fetching data: $e');
    }
    return products;
  }
}
