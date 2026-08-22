import 'package:flutter/material.dart';
import 'package:learning/week1/common_widget.dart';
import 'package:learning/week1/interactivity_widget.dart';
import 'package:learning/week2/layout_widget.dart';
import 'package:learning/week2/practice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Practice(),
    );
  }
}
