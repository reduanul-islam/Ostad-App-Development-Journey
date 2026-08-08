import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: controller,
          ),
        ),
      ),
    );
  }
}