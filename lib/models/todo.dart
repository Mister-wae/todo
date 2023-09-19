import 'package:flutter/material.dart';

class Todo {
  String title;
  bool isCompleted;

  Todo({required this.title, required this.isCompleted});
}

class TodoData with ChangeNotifier {
  List<Todo> todoList = [];
  List<Todo> donetodoList = [];

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

  void checkundoneTodo(int index, bool value) {
    todoList[index].isCompleted = value;
    doneTodoList(index);
    deleteTodo(index);
    notifyListeners();
  }

  // void checkdoneTodo(int index, bool value) {
  //   todoList[index].isCompleted = value;
  //   doneTodoList(index);
  //   deleteTodo(index);
  //   notifyListeners();
  // }

  void editTodo(int index, String value) {
    todoList[index].title = value;
    notifyListeners();
  }

  void doneTodoList(int index) {
    donetodoList.add(
      Todo(title: todoList[index].title, isCompleted: true),
    );
    notifyListeners();
  }

  void deletedoneTodo(int index) {
    donetodoList.removeAt(index);
    notifyListeners();
  }
}
