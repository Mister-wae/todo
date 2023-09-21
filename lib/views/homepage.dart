import 'package:flutter/material.dart';

import 'package:todo_class_work/views/add_todo_page.dart';
import 'package:todo_class_work/views/done_todo.dart';
import 'package:todo_class_work/views/search.dart';
import 'package:todo_class_work/views/undone_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchTodo());
              },
              icon: const Icon(Icons.search),
            )
          ],
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 2, 38, 68),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: "Todo task(s)",
              ),
              Tab(
                text: "Already done task(s)",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UndoneTodo(),
            DoneTodo(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTodoPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
