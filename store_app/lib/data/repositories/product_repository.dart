import '../fake_store_data.dart';
import '../models/product_model.dart';

/// Abstract Repository defining the contract for Product data operations (MVVM Data Layer)
abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<String>> getCategories();
  Future<List<Product>> getProductsByCategory(String category);
  Future<Product?> getProductById(int id);
}

/// Concrete implementation of ProductRepository using sample local data
class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    // Return sample products from data source
    return List<Product>.from(mockProducts);
  }

  @override
  Future<List<String>> getCategories() async {
    return List<String>.from(mockCategories);
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    if (category.toLowerCase() == 'all') {
      return getProducts();
    }
    return mockProducts
        .where((p) => p.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  @override
  Future<Product?> getProductById(int id) async {
    try {
      return mockProducts.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
