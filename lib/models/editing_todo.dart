import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_class_work/models/todo.dart';

class EditTodo extends StatelessWidget {
  final int index;
  final TextEditingController editController = TextEditingController();

  EditTodo({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    editController.text = Provider.of<TodoData>(context).todoList[index].title;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Edit Todo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Provider.of<TodoData>(
                    context,
                    listen: false,
                  ).editTodo(index, editController.text);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  size: 30,
                ),
              ),
            ],
          ),
          TextField(
            controller: editController,
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
