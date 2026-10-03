import 'package:flutter_test/flutter_test.dart';
import 'package:store_app/data/models/cart_item_model.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/app/view_models/cart_view_model.dart';
import 'package:store_app/app/view_models/product_view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FakeStore MVVM Architecture Tests', () {
    const testJson = {
      'id': 1,
      'title': 'Test Backpack',
      'price': 109.95,
      'description': 'Great pack for laptops',
      'category': "men's clothing",
      'image': 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
      'rating': {'rate': 4.5, 'count': 120},
    };

    test('Model: Product parses JSON correctly', () {
      final product = Product.fromJson(testJson);
      expect(product.id, 1);
      expect(product.title, 'Test Backpack');
      expect(product.price, 109.95);
      expect(product.rating.rate, 4.5);
      expect(product.rating.count, 120);
      expect(product.formattedPrice, '\$109.95');
    });

    test('Model: CartItem calculates totalPrice and copyWith', () {
      final product = Product.fromJson(testJson);
      final item = CartItem(product: product, quantity: 2);
      expect(item.totalPrice, 109.95 * 2);

      final updated = item.copyWith(quantity: 3);
      expect(updated.quantity, 3);
      expect(updated.totalPrice, 109.95 * 3);
    });

    test(
      'Repository: ProductRepositoryImpl returns products and categories',
      () async {
        final repo = ProductRepositoryImpl();
        final products = await repo.getProducts();
        final categories = await repo.getCategories();

        expect(products.isNotEmpty, true);
        expect(categories.contains('All'), true);
        expect(categories.contains('electronics'), true);
      },
    );

    test(
      'ViewModel: ProductViewModel filters, searches, and manages favorites',
      () async {
        final repo = ProductRepositoryImpl();
        final viewModel = ProductViewModel(repository: repo);
        await viewModel.loadProducts();

        expect(viewModel.products.isNotEmpty, true);

        // Category filtering
        viewModel.setCategory('electronics');
        expect(
          viewModel.filteredProducts.every((p) => p.category == 'electronics'),
          true,
        );

        // Search
        viewModel.setCategory('All');
        viewModel.setSearchQuery('Backpack');
        expect(viewModel.filteredProducts.length, 1);
        expect(
          viewModel.filteredProducts.first.title.contains('Backpack'),
          true,
        );

        // Favorites
        expect(viewModel.isFavorite(1), false);
        viewModel.toggleFavorite(1);
        expect(viewModel.isFavorite(1), true);
        viewModel.toggleFavorite(1);
        expect(viewModel.isFavorite(1), false);
      },
    );

    test(
      'ViewModel: CartViewModel handles cart math, discounts and promos',
      () {
        final cartViewModel = CartViewModel();
        final product = Product.fromJson(testJson);

        cartViewModel.addToCart(product, quantity: 2);
        expect(cartViewModel.totalCartCount, 2);
        expect(cartViewModel.subtotal, 109.95 * 2);

        // Free shipping over $50
        expect(cartViewModel.shippingFee, 0.0);

        // Apply promo
        final applied = cartViewModel.applyPromoCode('SAVE20');
        expect(applied, true);
        expect(cartViewModel.discountRate.value, 0.20);
        expect(cartViewModel.discountAmount, closeTo(109.95 * 2 * 0.20, 0.01));
      },
    );
  });
}
