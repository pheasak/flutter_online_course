import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

/// Simple API Client example using HTTPS (FakeStore API)
class ApiClient {
  static const String baseUrl = 'https://fakestoreapi.com';

  /// 1. Fetch all products: GET https://fakestoreapi.com/products
  Future<List<Product>> getProducts() async {
    final url = Uri.parse('$baseUrl/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  /// 2. Fetch a single product by ID: GET https://fakestoreapi.com/products/{id}
  Future<Product> getProductById(int id) async {
    final url = Uri.parse('$baseUrl/products/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return Product.fromJson(json);
    } else {
      throw Exception('Failed to load product $id: ${response.statusCode}');
    }
  }

  /// 3. Fetch all categories: GET https://fakestoreapi.com/products/categories
  Future<List<String>> getCategories() async {
    final url = Uri.parse('$baseUrl/products/categories');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((item) => item.toString()).toList();
    } else {
      throw Exception('Failed to load categories: ${response.statusCode}');
    }
  }

  /// 4. Fetch products by category: GET https://fakestoreapi.com/products/category/{category}
  Future<List<Product>> getProductsByCategory(String category) async {
    final url = Uri.parse('$baseUrl/products/category/$category');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to load products for category $category: ${response.statusCode}',
      );
    }
  }
}
