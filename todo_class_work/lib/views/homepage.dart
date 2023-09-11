import 'package:flutter/material.dart';
import 'package:todo_class_work/models/todo.dart';
import 'package:todo_class_work/views/add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            return ListTile(
              leading: IconButton(
                onPressed: () {
                  todoList.removeAt(index);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                icon: const Icon(Icons.delete),
              ),
              title: Text(todoList[index].title),
              trailing: Checkbox(
                value: todoList[index].isCompleted,
                onChanged: (bool? newValue) {
                  todoList[index].isCompleted = newValue!;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: todoList.length),
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
