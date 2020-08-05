import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoList()
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  List<String> todoItem = [];

  void addTodo() {
    setState(() {
      int index = todoItem.length;
      todoItem.add('Item' + index.toString());
    });
  }

  Widget buildTodoList() {
    return ListView.builder(itemBuilder: (context, index) {
      if(index < todoItem.length) {
        return buildTodoItem(todoItem[index]);
      }
    });
  }

  Widget buildTodoItem(String todoText) {
    return ListTile(
      title: Text(todoText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        tooltip: 'add todo',
        child: Icon(Icons.add),
      ),
    );
  }
}