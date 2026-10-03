import '../fake_store_data.dart';
import '../models/product_model.dart';

/// Sample data service providing local FakeStore UI data without external network requests.
class ApiService {
  /// Returns sample products directly from local mock data
  Future<List<Product>> getProducts() async {
    return List.from(mockProducts);
  }

  /// Returns sample categories
  Future<List<String>> getCategories() async {
    return List.from(mockCategories.where((c) => c != 'All'));
  }

  /// Returns products filtered by category from local sample data
  Future<List<Product>> getProductsByCategory(String category) async {
    return mockProducts
        .where((p) => p.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  /// Returns a single sample product by ID
  Future<Product> getProductById(int id) async {
    return mockProducts.firstWhere(
      (p) => p.id == id,
      orElse: () => mockProducts.first,
    );
  }
}
