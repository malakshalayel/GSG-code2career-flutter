import 'package:e_commerce_design1/features/products/data/product_model.dart';
import 'package:e_commerce_design1/features/products/data/product_repository.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> cart = [];
  List<ProductModel> products = [];

  void addToCart(ProductModel product) {
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }

  fetchData() async {
    var fetchProducts = await ProductRepository.fetchProduct();
    products = fetchProducts;
    notifyListeners();
  }
}
