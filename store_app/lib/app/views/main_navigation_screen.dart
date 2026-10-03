import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_theme.dart';
import '../view_models/cart_view_model.dart';
import '../view_models/navigation_view_model.dart';
import 'cart_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';
import 'wishlist_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navViewModel = Get.find<NavigationViewModel>();
    final cartViewModel = Get.find<CartViewModel>();

    final List<Widget> screens = const [
      HomeScreen(),
      CategoriesScreen(),
      WishlistScreen(),
      CartScreen(),
    ];

    return Obx(() {
      final cartCount = cartViewModel.totalCartCount;

      return Scaffold(
        body: IndexedStack(
          index: navViewModel.currentIndex.value,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: NavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.12),
            selectedIndex: navViewModel.currentIndex.value,
            onDestinationSelected: navViewModel.changeIndex,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(
                  Icons.home_rounded,
                  color: AppTheme.primaryColor,
                ),
                label: 'Shop',
              ),
              const NavigationDestination(
                icon: Icon(Icons.grid_view_outlined),
                selectedIcon: Icon(
                  Icons.grid_view_rounded,
                  color: AppTheme.primaryColor,
                ),
                label: 'Categories',
              ),
              const NavigationDestination(
                icon: Icon(Icons.favorite_outline_rounded),
                selectedIcon: Icon(
                  Icons.favorite_rounded,
                  color: AppTheme.primaryColor,
                ),
                label: 'Wishlist',
              ),
              NavigationDestination(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_bag_outlined),
                    if (cartCount > 0)
                      Positioned(
                        top: -4,
                        right: -6,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: AppTheme.errorColor,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '$cartCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                selectedIcon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.shopping_bag_rounded,
                      color: AppTheme.primaryColor,
                    ),
                    if (cartCount > 0)
                      Positioned(
                        top: -4,
                        right: -6,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: AppTheme.errorColor,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '$cartCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                label: 'Cart',
              ),
            ],
          ),
        ),
      );
    });
  }
}
