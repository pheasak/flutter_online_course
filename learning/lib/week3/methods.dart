// // Increment item quantity
//   void _incrementQuantity(int index) {
//     setState(() {
//       _cartItems[index].quantity++;
//     });
//   }

//   // Decrement item quantity (removes item if quantity reaches 0)
//   void _decrementQuantity(int index) {
//     setState(() {
//       if (_cartItems[index].quantity > 1) {
//         _cartItems[index].quantity--;
//       } else {
//         _removeItem(index);
//       }
//     });
//   }

//   // Remove item confirmation / execution
//   void _removeItem(int index) {
//     final removedItem = _cartItems[index];
//     setState(() {
//       _cartItems.removeAt(index);
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('${removedItem.title.split('\n')[0]} removed'),
//         action: SnackBarAction(
//           label: 'UNDO',
//           onPressed: () {
//             setState(() {
//               _cartItems.insert(index, removedItem);
//             });
//           },
//         ),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   // Clear all items in cart
//   void _clearCart() {
//     if (_cartItems.isEmpty) return;

//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: const Text('Clear Cart'),
//         content: const Text(
//           'Are you sure you want to remove all items from your cart?',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(ctx).pop(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(ctx).pop();
//               setState(() {
//                 _cartItems.clear();
//               });
//             },
//             style: TextButton.styleFrom(foregroundColor: Colors.red),
//             child: const Text('Clear All'),
//           ),
//         ],
//       ),
//     );
//   }
