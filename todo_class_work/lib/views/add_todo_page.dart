import 'package:flutter/material.dart';
import 'package:todo_class_work/models/todo.dart';
import 'package:todo_class_work/views/homepage.dart';

class AddTodoPage extends StatelessWidget {
  final todoTitle = '';
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, String> todoItem = {
                "title": todoController.text.toString(),
              };
              newtodo(todoItem);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: todoController,
        ),
      ),
    );
  }
}
