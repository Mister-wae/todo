import 'package:flutter/material.dart';

class Todo {
  String title;
  bool isCompleted;

  Todo({required this.title, required this.isCompleted});
}

// newtodo(Map<String, dynamic> item) {
//   todoList.add(
//     Todo(title: item["title"], isCompleted: false),
//   );
// }

class TodoData with ChangeNotifier {
  List<Todo> todoList = [];

  void updateTodoList(Map<String, dynamic> item) {
    todoList.add(
      Todo(title: item["title"], isCompleted: false),
    );
    notifyListeners();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}
