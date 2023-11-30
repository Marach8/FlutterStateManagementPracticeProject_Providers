import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:providers_practice/custommarachitem.dart';


class MarachItemProvider extends ChangeNotifier{
  final List<MarachItem> _marachItems = [];
  UnmodifiableListView<MarachItem> get marachItems => UnmodifiableListView(_marachItems);

  void addItem(MarachItem marachItem) {
    for (final item in _marachItems){item.activate();}
    _marachItems.add(marachItem); notifyListeners();
  }

  void reset(){_marachItems.clear(); notifyListeners();}
}