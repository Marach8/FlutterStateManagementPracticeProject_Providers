import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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
          '/addItemRoute': (context) => const MaterialApp()
        }
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'), centerTitle: true),
      body: Column(
        children: [
          TextButton(
            onPressed: (){Navigator.of(context).pushNamed('/addItemRoute');},
            child: const Text('Add New Item')
          ),
          const Gap(5),
          TextButton(
            onPressed: (){context.read<MarachItemProvider>().reset();},
            child: const Text('reset')
          )
        ],
      )
    );
  }
}



class MarachItem extends Object{
  bool isActive; final String name; String uuid;
  MarachItem({required this.isActive, required this.name}): uuid = const Uuid().v4();

  void activate() => isActive = true;

  @override
  bool operator ==(covariant MarachItem other) => uuid == other.uuid;
  
  @override
  int get hashCode => uuid.hashCode;
  
  String get title => name + (isActive? ' > ' : '');
}



class MarachItemProvider extends ChangeNotifier{
  final List<MarachItem> _marachItems = [];
  UnmodifiableListView<MarachItem> get marachItems => UnmodifiableListView(_marachItems);

  void addItem(MarachItem marachItem) {
    for (final item in _marachItems){item.activate();}
    _marachItems.add(marachItem); notifyListeners();
  }

  void reset(){_marachItems.clear(); notifyListeners();}
}



class MarachItemsWidget extends StatelessWidget {
  final UnmodifiableListView<MarachItem> marachItem;
  const MarachItemsWidget({required this.marachItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: marachItem.map((item){
        return Text(
          item.title, 
          style: TextStyle(color: item.isActive ? Colors.blue: Colors.black)
        );
      }).toList(),
    );
  }
}