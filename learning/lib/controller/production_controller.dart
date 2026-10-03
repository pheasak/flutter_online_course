import 'package:get/get.dart';
import 'package:learning/data/product_data.dart';

class ProductionController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> cartItems = <Product>[].obs;

  @override
  void onInit() {
    products.assignAll(productList);
    super.onInit();
  }

  void addToCart(Product product) {
    cartItems.add(product);
    print(cartItems.length);
  }
}

class ProductBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductionController());
  }
}
