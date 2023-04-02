import 'package:flutter/material.dart';
import 'berita.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: BeritaPage(),
    );
  }
}
