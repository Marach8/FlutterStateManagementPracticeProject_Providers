import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)
      ),
      home: const HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class Marach extends Object{
  bool isActive; final String name; String uuid;
  Marach({required this.isActive, required this.name}): uuid = const Uuid().v4();

  void activate() => isActive = true;

  @override
  bool operator ==(covariant Marach other) => uuid == other.uuid;
  
  @override
  int get hashCode => uuid.hashCode;
  
}