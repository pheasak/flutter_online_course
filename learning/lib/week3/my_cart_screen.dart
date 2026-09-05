import 'package:flutter/material.dart';
import 'package:learning/week3/counter_button_widget.dart';

/// Model representing an item in the cart
class CartItem {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  // Initial list of items in the cart based on preview design
  final List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      title: 'Apple MacBook Air M2',
      subtitle: 'Starlight, 13", 8GB, 256GB SSD',
      price: 1199.00,
      imageUrl:
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&auto=format&fit=crop&q=80',
      quantity: 1,
    ),
    CartItem(
      id: '2',
      title: 'iPhone 15 Pro Titanium',
      subtitle: 'Black, 128GB',
      price: 999.00,
      imageUrl:
          'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500&auto=format&fit=crop&q=80',
      quantity: 1,
    ),
    CartItem(
      id: '3',
      title: 'Sony WH-1000XM5\nHeadphones',
      subtitle: 'Black, Noise Cancelling',
      price: 499.00,
      imageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop&q=80',
      quantity: 1,
    ),
  ];

  // Fixed discount amount
  final double _discountAmount = 50.00;
  final double _taxRate = 0.10; // 10%

  // Calculated values
  int get _totalItemCount =>
      _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get _subtotal =>
      _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  double get _discount => _cartItems.isEmpty ? 0.0 : _discountAmount;

  double get _taxableAmount =>
      (_subtotal > _discount) ? (_subtotal - _discount) : 0.0;

  double get _tax => _taxableAmount * _taxRate;

  double get _total => _taxableAmount + _tax;

  // Format currency with comma separator: e.g. 2,911.70
  String _formatCurrency(double amount) {
    List<String> parts = amount.toStringAsFixed(2).split('.');
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    parts[0] = parts[0].replaceAllMapped(reg, (Match m) => '${m[1]},');
    return '\$${parts.join('.')}';
  }

  // void increment(int value) {
  //   setState(() {

  //   });
  // }

  // void decrement(int value) {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF3843A1);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'My Cart ($_totalItemCount ${_totalItemCount == 1 ? "Item" : "Items"})',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.black87),
            tooltip: 'Clear Cart',
            onPressed: () {},
            // onPressed: _clearCart,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade200, height: 1),
        ),
      ),
      body: _cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add items to get started',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  // List of cart item cards
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _cartItems.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return _buildCartItemCard(item, index, primaryColor);
                    },
                  ),

                  const SizedBox(height: 16),

                  // Order Summary Card
                  _buildOrderSummaryCard(),

                  const SizedBox(height: 16),

                  // Checkout Button
                  _buildCheckoutButton(primaryColor),

                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  /// Cart Item Card
  Widget _buildCartItemCard(CartItem item, int index, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image Container
          Container(
            width: 82,
            height: 82,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Icon(
                    Icons.devices,
                    size: 36,
                    color: Colors.grey.shade500,
                  ),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Product Details & Counter
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),

                // Subtitle
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 10),

                // Price and Quantity Counter Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price
                    Text(
                      _formatCurrency(item.price),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    // Counter Pill Widget
                    CounterButtonWidget(
                      value: item.quantity,
                      decrement: (value) {
                        setState(() {
                          _cartItems[index].quantity = value;
                        });
                      },
                      increment: (value) {
                        setState(() {
                          _cartItems[index].quantity = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Order Summary Card
  Widget _buildOrderSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 14),

          // Subtotal
          _buildSummaryRow(
            label: 'Subtotal',
            value: _formatCurrency(_subtotal),
          ),
          const SizedBox(height: 10),

          // Discount
          _buildSummaryRow(
            label: 'Discount',
            value: '(-${_formatCurrency(_discount)})',
            valueColor: const Color(0xFF2E7D32),
          ),
          const SizedBox(height: 10),

          // Tax
          _buildSummaryRow(label: 'Tax (10%)', value: _formatCurrency(_tax)),
          const SizedBox(height: 14),

          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                _formatCurrency(_total),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper row for summary items
  Widget _buildSummaryRow({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15, color: Colors.black87),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  /// Bottom Checkout Pill Button
  Widget _buildCheckoutButton(Color primaryColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _cartItems.isEmpty
            ? null
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Order placed successfully! Total: ${_formatCurrency(_total)}',
                    ),
                    backgroundColor: primaryColor,
                  ),
                );
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row with Checkout text & arrow
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
            const SizedBox(height: 2),

            // Secondary line: Proceed to Checkout ($X,XXX.XX)
            Text(
              'Proceed to Checkout (${_formatCurrency(_total)})',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.85),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
