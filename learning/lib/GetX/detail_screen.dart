import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/GetX/counter_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CounterController>();
    return Scaffold(
      appBar: AppBar(title: Text('Detail Counter value')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${controller.counter.value}')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: Text('-'),
                ),

                ElevatedButton(
                  onPressed: controller.increment,
                  child: Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
