import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isFavorite,
      builder: (context, value, child) {
        return IconButton(
          icon: Icon(
            value ? Icons.favorite : Icons.favorite_border,
            color: value ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            isFavorite.value = !isFavorite.value; // ប្តូរតម្លៃ reactive ភ្លាមៗ
          },
        );
      },
    );
  }
}
