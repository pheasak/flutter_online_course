import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository.dart';

/// ViewModel for Product listing, categorization, search, filtering, and favorites
class ProductViewModel extends GetxController {
  final ProductRepository _repository;

  ProductViewModel({ProductRepository? repository})
    : _repository = repository ?? ProductRepositoryImpl();

  // Observable States
  final RxList<Product> products = <Product>[].obs;
  final RxList<String> categories = <String>['All'].obs;
  final RxString selectedCategory = 'All'.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedSort = 'Popular'.obs;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  // Favorites state
  final RxSet<int> favoriteIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  /// Fetch products & categories from repository
  Future<void> loadProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final fetchedProducts = await _repository.getProducts();
      final fetchedCategories = await _repository.getCategories();

      products.assignAll(fetchedProducts);
      categories.assignAll(fetchedCategories);
    } catch (e) {
      errorMessage.value = 'Failed to load products: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Pull-to-refresh
  Future<void> refreshProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    await loadProducts();
  }

  /// Change active category filter
  void setCategory(String category) {
    selectedCategory.value = category;
  }

  /// Update search query
  void setSearchQuery(String query) {
    searchQuery.value = query.trim().toLowerCase();
  }

  /// Update sorting strategy
  void setSortOption(String sortOption) {
    selectedSort.value = sortOption;
  }

  /// Filtered and sorted products derived state
  List<Product> get filteredProducts {
    List<Product> list = List.from(products);

    // 1. Category filter
    if (selectedCategory.value != 'All') {
      list = list
          .where(
            (p) =>
                p.category.toLowerCase() ==
                selectedCategory.value.toLowerCase(),
          )
          .toList();
    }

    // 2. Search query filter
    if (searchQuery.value.isNotEmpty) {
      final q = searchQuery.value;
      list = list.where((p) {
        final title = p.title.toLowerCase();
        final desc = p.description.toLowerCase();
        final cat = p.category.toLowerCase();
        return title.contains(q) || desc.contains(q) || cat.contains(q);
      }).toList();
    }

    // 3. Sorting logic
    switch (selectedSort.value) {
      case 'Price: Low to High':
        list.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        list.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Top Rated':
        list.sort((a, b) => b.rating.rate.compareTo(a.rating.rate));
        break;
      case 'Popular':
      default:
        list.sort((a, b) => b.rating.count.compareTo(a.rating.count));
        break;
    }

    return list;
  }

  /// Favorite / Wishlist handling
  void toggleFavorite(int productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }
  }

  bool isFavorite(int productId) => favoriteIds.contains(productId);

  List<Product> get favoriteProducts {
    return products.where((p) => favoriteIds.contains(p.id)).toList();
  }

  List<Product> getRelatedProducts(Product product, {int limit = 5}) {
    return products
        .where((p) => p.category == product.category && p.id != product.id)
        .take(limit)
        .toList();
  }
}
