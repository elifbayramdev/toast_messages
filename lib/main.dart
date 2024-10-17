import 'package:flutter/material.dart';
import 'toast_message.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toast Messages',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 111, 253, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
