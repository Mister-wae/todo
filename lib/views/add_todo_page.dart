import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_class_work/models/todo.dart';
import 'package:todo_class_work/views/homepage.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController todoController = TextEditingController();
  AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, String> todoItem = {
                "title": todoController.text.toString(),
              };
              Provider.of<TodoData>(context, listen: false)
                  .updateTodoList(todoItem);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(
            hintText: "Type here",
          ),
          controller: todoController,
        ),
      ),
    );
  }
}
