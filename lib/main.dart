import 'package:flutter/material.dart';
import 'package:pocketplans/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const Text("Hello World"),
    );
  }
}
