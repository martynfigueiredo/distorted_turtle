import 'package:flutter/material.dart';
import 'page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distorted Turtle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0)
      ),
      home: const Page1(),
      debugShowCheckedModeBanner: false,
    );
  }
}