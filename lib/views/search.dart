import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_class_work/models/editing_todo.dart';
import 'package:todo_class_work/models/todo.dart';

class SearchTodo extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var title in Provider.of<TodoData>(context).todoListTitles) {
      if (title.toLowerCase().contains(
            query.toLowerCase(),
          )) {
        matchQuery.add(title);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return EditTodo(
                  index: index,
                );
              },
            );
          },
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    var todoTitles = List.from(Provider.of<TodoData>(context).todoListTitles);
    for (var title in todoTitles) {
      if (title.toLowerCase().contains(
            query.toLowerCase(),
          )) {
        matchQuery.add(title);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return EditTodo(
                  index: index,
                );
              },
            );
          },
        );
      },
    );
  }
}
