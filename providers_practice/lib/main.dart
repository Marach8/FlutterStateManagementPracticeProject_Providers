import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_practice/views/additem_view.dart';
import 'package:providers_practice/views/homeview.dart';
import 'package:providers_practice/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MarachItemProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)
        ),
        home: const HomePage(),
        routes: {
          '/addItemRoute': (context) => const AddItemView()
        }
      ),
    );
  }
}