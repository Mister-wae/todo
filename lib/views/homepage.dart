import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_class_work/models/todo.dart';
import 'package:todo_class_work/views/add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoData>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.checklist,
          size: 30,
          color: Color.fromARGB(255, 2, 38, 68),
        ),
        title: const Text(
          "MyTodo",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 30,
            color: Color.fromARGB(255, 2, 38, 68),
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          print("building mainpage");
          return Consumer<TodoData>(
            builder: (context, value, child) => ListTile(
              leading: child,
              title: Text(Provider.of<TodoData>(
                context,
                listen: true,
              ).todoList[index].title),
              trailing: Checkbox(
                value:
                    Provider.of<TodoData>(context).todoList[index].isCompleted,
                onChanged: (bool? newValue) {
                  Provider.of<TodoData>(
                    context,
                    listen: false,
                  ).todoList[index].isCompleted = newValue!;
                },
              ),
            ),
            child: IconButton(
              onPressed: () => provider.deleteTodo(index),
              icon: const Icon(Icons.delete),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: Provider.of<TodoData>(context).todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTodoPage(),
            ),
          );
        },
      ),
    );
  }
}
