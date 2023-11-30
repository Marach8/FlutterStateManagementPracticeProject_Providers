import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MarachItem {
  bool isActive; final String name, uuid;
  MarachItem({required this.isActive, required this.name}): uuid = const Uuid().v4();

  void activate() => isActive = true;

  @override
  bool operator ==(covariant MarachItem other) => uuid == other.uuid;
  
  @override
  int get hashCode => uuid.hashCode;
  String get title => name + (isActive? ' > ' : '');
}





class MarachItemsWidget extends StatelessWidget {
  final UnmodifiableListView<MarachItem> marachItems;
  const MarachItemsWidget({required this.marachItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: marachItems.map((item){
        return Text(
          item.title, 
          style: TextStyle(color: item.isActive ? Colors.blue: Colors.black)
        );
      }).toList(),
    );
  }
}