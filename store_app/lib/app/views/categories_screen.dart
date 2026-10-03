import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import '../view_models/navigation_view_model.dart';
import '../view_models/product_view_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> _categoryData = const [
    {
      'name': "electronics",
      'display': 'Electronics & Gadgets',
      'icon': Icons.devices_other_rounded,
      'gradient': [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
      'desc': 'Laptops, SSDs, Monitors & Accessories',
    },
    {
      'name': "jewelery",
      'display': 'Jewelry & Luxury',
      'icon': Icons.diamond_outlined,
      'gradient': [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
      'desc': 'Gold rings, silver bracelets & chains',
    },
    {
      'name': "men's clothing",
      'display': "Men's Fashion",
      'icon': Icons.male_rounded,
      'gradient': [Color(0xFF0D9488), Color(0xFF047857)],
      'desc': 'Jackets, t-shirts & slim fits',
    },
    {
      'name': "women's clothing",
      'display': "Women's Collection",
      'icon': Icons.female_rounded,
      'gradient': [Color(0xFFEC4899), Color(0xFFBE185D)],
      'desc': 'Dresses, jackets, casual & party wear',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final productViewModel = Get.find<ProductViewModel>();
    final navigationViewModel = Get.find<NavigationViewModel>();

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackground,
      appBar: AppBar(
        title: const Text(
          'Product Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _categoryData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final cat = _categoryData[index];
          final catKey = cat['name'] as String;
          final gradient = cat['gradient'] as List<Color>;

          // Count items in category
          return Obx(() {
            final count = productViewModel.products
                .where((p) => p.category.toLowerCase() == catKey.toLowerCase())
                .length;

            return InkWell(
              onTap: () {
                productViewModel.setCategory(catKey);
                // Switch to home tab
                navigationViewModel.changeIndex(0);
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: gradient.first.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Watermark icon
                    Positioned(
                      right: -10,
                      bottom: -15,
                      child: Icon(
                        cat['icon'] as IconData,
                        size: 110,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                cat['icon'] as IconData,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                cat['display'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            cat['desc'] as String,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$count Products Available',
                            style: const TextStyle(
                              color: Color(0xFFFEF08A),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
