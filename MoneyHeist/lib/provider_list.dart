import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<int> favChats = [];

  void addToList(int justLiked) {
    favChats.add(justLiked);
    favChats.toSet().toList();
    notifyListeners();
  }

  void removeFromList(int justLiked) {
    favChats.remove(justLiked);
    favChats.toSet().toList();
    notifyListeners();
  }
}