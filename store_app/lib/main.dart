import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/repositories/product_repository.dart';
import 'core/theme/app_theme.dart';
import 'app/view_models/cart_view_model.dart';
import 'app/view_models/navigation_view_model.dart';
import 'app/view_models/product_view_model.dart';
import 'app/views/main_navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FakeStoreApp());
}

class FakeStoreApp extends StatelessWidget {
  const FakeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MVVM Dependency Injection
    // 1. Data Layer: Repository
    Get.put<ProductRepository>(ProductRepositoryImpl(), permanent: true);

    // 2. ViewModel Layer: Injected with Repository
    Get.put(
      ProductViewModel(repository: Get.find<ProductRepository>()),
      permanent: true,
    );
    Get.put(CartViewModel(), permanent: true);
    Get.put(NavigationViewModel(), permanent: true);

    // 3. View Layer
    return GetMaterialApp(
      title: 'FakeStore App (MVVM)',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigationScreen(),
      defaultTransition: Transition.cupertino,
    );
  }
}
