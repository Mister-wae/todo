class Todo {
  String title;
  bool isCompleted;

  Todo({required this.title, required this.isCompleted});
}

List<Todo> todoList = [];
newtodo(Map<String, dynamic> item) {
  todoList.add(
    Todo(title: item["title"], isCompleted: false),
  );
}
