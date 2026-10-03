import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/controller/production_controller.dart';
import 'package:learning/data/product_data.dart';
import 'package:learning/week3/button_counter_widget.dart';
import 'package:learning/week3/favorite_button_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Product args = ModalRoute.of(context)!.settings.arguments as Product;
    final controller = Get.find<ProductionController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(args.title),
        actions: [FavoriteButton(), SizedBox(width: 8)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(args.imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              args.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '\$${args.price}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              args.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CounterWidget(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 16),
            ),
            backgroundColor: MaterialStatePropertyAll(Colors.indigo),
          ),
          onPressed: () {
            controller.addToCart(args);
          },
          child: Text(
            'Add to cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
