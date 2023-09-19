import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_class_work/models/todo.dart';

class DoneTodo extends StatelessWidget {
  const DoneTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoData>(
      context,
      listen: false,
    );
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Consumer<TodoData>(
            builder: (context, value, child) => ListTile(
              leading: child,
              title: Text(
                  Provider.of<TodoData>(context).donetodoList[index].title),
              // trailing: Checkbox(
              //   value:
              //       Provider.of<TodoData>(context).todoList[index].isCompleted,
              //   onChanged: (value) {

              //   },
              // ),
            ),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete todo?"),
                      content: const Text(
                          "Are you sure you want to delete this to-do?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("NO"),
                        ),
                        TextButton(
                          autofocus: true,
                          onPressed: () {
                            provider.deletedoneTodo(index);
                            Navigator.pop(context);
                          },
                          child: const Text("YES"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: Provider.of<TodoData>(context).donetodoList.length,
      ),
    );
  }
}
