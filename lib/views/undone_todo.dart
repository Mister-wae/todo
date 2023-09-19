import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_class_work/models/editing_todo.dart';
import 'package:todo_class_work/models/todo.dart';

class UndoneTodo extends StatelessWidget {
  const UndoneTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoData>(context);

    return Scaffold(
        body: ListView.separated(
      itemBuilder: (context, index) {
        return Consumer<TodoData>(
          builder: (context, value, child) => ListTile(
            leading: IconButton(
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
                            provider.deleteTodo(index);
                            Navigator.pop(context);
                          },
                          child: const Text("YES"),
                        ),
                      ],
                    );
                  },
                );
                // provider.deleteTodo(index);
                // ScaffoldMessenger.of(context).showSnackBar(deleteSnack);
              },
              icon: const Icon(Icons.delete),
            ),
            title: Text(Provider.of<TodoData>(
              context,
              listen: true,
            ).todoList[index].title),
            trailing: Checkbox(
              value: Provider.of<TodoData>(context).todoList[index].isCompleted,
              onChanged: (bool? newValue) {
                // provider.checkundoneTodo(index, newValue!);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Done?"),
                      content: const Text("Are you done with this to-do?"),
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
                            provider.checkundoneTodo(index, newValue!);
                            Navigator.pop(context);
                          },
                          child: const Text("YES"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return EditTodo(
                      index: index,
                    );
                  });
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: Provider.of<TodoData>(context).todoList.length,
    ));
  }
}
