import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/GetX/counter_controller.dart';
import 'package:learning/GetX/detail_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(title: Text('CounterButton With GetX')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: Text('-'),
                ),

                Obx(() {
                  return Text('${controller.counter.value}');
                }),
                ElevatedButton(
                  onPressed: controller.increment,
                  child: Text('+'),
                ),
              ],
            ),

            TextButton(
              onPressed: () {
                Get.to(DetailScreen());
              },
              child: Text('Go to Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
