import 'package:flutter/material.dart';

import '../Model/todo_Model.dart';

class TodoController with ChangeNotifier {
  final List<Todo> _allTodo = [];

  List<Todo> get allTodo => [..._allTodo];

  Todo? findById(String? id) {
    return _allTodo.firstWhere((prod) => prod?.id == id);
  }

  void addProduct(Todo product) {
    _allTodo.add(product);
    notifyListeners();
  }
  void edit(Todo product) {
    final index = _allTodo.indexWhere(
          (element) => element!.id == product.id,
    );
    _allTodo[index] = product;
    notifyListeners();
  }
  remove(String id) {
    _allTodo.removeWhere((element) => element!.id == id);
    notifyListeners();
  }
  void sortNew() {
    _allTodo.sort((b, a) {
      return a.dateTime!.millisecondsSinceEpoch
          .compareTo(b.dateTime!.millisecondsSinceEpoch);
    });
    notifyListeners();
  }

  void sortAZ() {
    _allTodo.sort((a, b) {
      return a.title!.compareTo(b.title!);
    });
    notifyListeners();
  }

  List<Todo> todosList = [];
  void find(String query){
    todosList = todosList.where((element) => element.title == query).toList();
    notifyListeners();
  }

}