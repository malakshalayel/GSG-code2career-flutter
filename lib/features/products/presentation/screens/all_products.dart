import 'package:e_commerce_design1/features/products/presentation/provider/cart_provider.dart';
import 'package:e_commerce_design1/features/products/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    final ValueNotifier<bool> _enabled = ValueNotifier<bool>(false);

    return Scaffold(
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _enabled,
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              _enabled.value = !_enabled.value;
            },
          );
        },
      ),
      appBar: AppBar(title: Text("All Products")),
      body: ValueListenableBuilder<bool>(
        valueListenable: _enabled,
        builder: (context, value, child) {
          return Skeletonizer(
            enabled: _enabled.value,

            child: ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                return ProductWidget(product: productProvider.products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
