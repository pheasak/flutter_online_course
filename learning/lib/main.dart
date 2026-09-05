import 'package:flutter/material.dart';
import 'package:learning/week2/detail_screen.dart';
import 'package:learning/week2/practice.dart';
import 'package:learning/week3/my_cart_screen.dart';
import 'package:learning/week3/tip_caculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const TipCaculatorScreen(),
        '/productDetailScreen': (context) => const ProductDetailScreen(),
        '/cart': (context) => const MyCartScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: const Practice(),
    );
  }
}
