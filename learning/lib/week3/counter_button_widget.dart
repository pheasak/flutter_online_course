import 'package:flutter/material.dart';
import 'package:learning/week3/my_cart_screen.dart';

class CounterButtonWidget extends StatelessWidget {
  final int value;

  void Function(int)? increment;
  void Function(int)? decrement;
  CounterButtonWidget({
    super.key,
    required this.value,
    this.increment,
    this.decrement,
  });
  late final ValueNotifier<int> quantity = ValueNotifier<int>(value);

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF3843A1);
    return // Counter Pill Widget
    ValueListenableBuilder<int>(
      valueListenable: quantity,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Decrement button
              GestureDetector(
                onTap: () {
                  if (quantity.value <= 1) {
                    return;
                  }
                  quantity.value--;
                  decrement?.call(quantity.value);
                },
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Icon(Icons.remove, color: Colors.white, size: 16),
                ),
              ),

              // Quantity Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  '${value}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              // Increment button
              GestureDetector(
                onTap: () {
                  quantity.value++;
                  increment?.call(quantity.value);
                },
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
