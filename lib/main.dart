import 'package:dcworld/screen/movieList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DC World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieList(),
    );
  }
}
