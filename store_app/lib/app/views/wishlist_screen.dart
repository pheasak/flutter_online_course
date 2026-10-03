import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_theme.dart';
import '../view_models/product_view_model.dart';
import '../../widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<ProductViewModel>();

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackground,
      appBar: AppBar(
        title: Obx(
          () => Text(
            'Saved Items (${viewModel.favoriteProducts.length})',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final favorites = viewModel.favoriteProducts;

        if (favorites.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.errorColor.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_outline_rounded,
                      size: 50,
                      color: AppTheme.errorColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No Favorites Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap the heart icon on any product to save it to your wishlist for later.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return ProductCard(product: favorites[index]);
          },
        );
      }),
    );
  }
}
