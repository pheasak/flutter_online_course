import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:learning/GetX/counter_screen.dart';
import 'package:learning/controller/production_controller.dart';
import 'package:learning/week2/detail_screen.dart';
import 'package:learning/week2/practice.dart';
import 'package:learning/week3/my_cart_screen.dart';
import 'package:learning/week3/tip_caculator_screen.dart';

import 'package:learning/week4/pratice_exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/week4',
      // routes: {
      //   '/': (context) => const PracticeExercise(),
      //   '/productDetailScreen': (context) => const ProductDetailScreen(),
      //   '/cart': (context) => const MyCartScreen(),
      //   '/week4': (context) => const PracticeExercise(),
      // },
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const Practice(),
          binding: ProductBindings(),
        ),
        GetPage(
          name: '/productDetailScreen',
          page: () => const ProductDetailScreen(),
          binding: ProductBindings(),
        ),
        GetPage(
          name: '/cart',
          page: () => const MyCartScreen(),
          binding: ProductBindings(),
        ),
        // GetPage(name: '/week4', page: () => const PracticeExercise()),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: Practice(),
    );
  }
}
