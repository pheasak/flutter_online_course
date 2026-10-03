import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/product_model.dart';

/// ViewModel for Cart management, promo voucher application, and financial calculations
class CartViewModel extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;
  final RxString appliedPromoCode = ''.obs;
  final RxDouble discountRate = 0.0.obs;

  /// Cart item count
  int get totalCartCount =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);

  /// Subtotal
  double get subtotal =>
      cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  /// Discount amount
  double get discountAmount => subtotal * discountRate.value;

  /// Shipping fee (Free over $50 or with FREESHIP promo)
  double get shippingFee {
    if (subtotal == 0) return 0.0;
    if (subtotal >= 50.0 || appliedPromoCode.value.contains('FREESHIP')) {
      return 0.0;
    }
    return 4.99;
  }

  /// Estimated Tax (8%)
  double get estimatedTax {
    if (subtotal == 0) return 0.0;
    return (subtotal - discountAmount) * 0.08;
  }

  /// Grand Total
  double get grandTotal {
    if (subtotal == 0) return 0.0;
    final total = subtotal - discountAmount + shippingFee + estimatedTax;
    return total < 0 ? 0.0 : total;
  }

  String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  /// Add product to cart with feedback
  void addToCart(Product product, {int quantity = 1}) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }

    if (Get.context != null) {
      Get.showSnackbar(
        GetSnackBar(
          messageText: Row(
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Added "${product.title.length > 25 ? '${product.title.substring(0, 25)}...' : product.title}" to cart',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF1E293B),
          borderRadius: 14,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          duration: const Duration(milliseconds: 1800),
          animationDuration: const Duration(milliseconds: 300),
        ),
      );
    }
  }

  void increaseQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decreaseQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        cartItems.refresh();
      } else {
        cartItems.removeAt(index);
      }
    }
  }

  void removeFromCart(int productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
  }

  void clearCart() {
    cartItems.clear();
    appliedPromoCode.value = '';
    discountRate.value = 0.0;
  }

  /// Apply promo vouchers
  bool applyPromoCode(String code) {
    final cleanCode = code.trim().toUpperCase();
    if (cleanCode == 'SAVE20') {
      appliedPromoCode.value = 'SAVE20 (20% OFF)';
      discountRate.value = 0.20;
      return true;
    } else if (cleanCode == 'WELCOME10') {
      appliedPromoCode.value = 'WELCOME10 (10% OFF)';
      discountRate.value = 0.10;
      return true;
    } else if (cleanCode == 'FREESHIP') {
      appliedPromoCode.value = 'FREESHIP (Free Shipping)';
      discountRate.value = 0.05;
      return true;
    }
    return false;
  }

  void removePromoCode() {
    appliedPromoCode.value = '';
    discountRate.value = 0.0;
  }
}
