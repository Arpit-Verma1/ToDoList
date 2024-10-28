import 'package:flutter/cupertino.dart';

import '../Model/TodoModel.dart';

class todoProvider with ChangeNotifier {
  List<todo> _todos = [];
  List<todo> get todos => _todos;
  void addTodod(String title, String description) {
    final value = todo(title: title, description: description);
    _todos.add(value);
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, String title, String description) {
    _todos[index].title = title;
    _todos[index].description = description;
    notifyListeners();
  }
}
