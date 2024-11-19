import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${product.fields.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 10),
            Text("Price: \$${product.fields.price}"),
            const SizedBox(height: 10),
            Text("User ID: ${product.fields.user}"),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Return to the Product list page
                },
                child: const Text('Back to List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
