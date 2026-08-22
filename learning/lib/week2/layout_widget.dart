import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layout Widget')),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(height: 200, width: 200, color: Colors.amber),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(backgroundColor: Colors.red),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
