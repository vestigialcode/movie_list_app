import 'package:flutter/material.dart';
import 'package:movie_list_app/models/todo.dart';
import 'package:movie_list_app/todoInput.dart';
import 'package:movie_list_app/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie list app',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> _todo = [];

  void _addTodo(String title, String item) {
    final newTodo = Todo(
        id: DateTime.now().toString(),
        date: DateTime.now(),
        items: item,
        title: title);
    setState(() {
      _todo.add(newTodo);
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todo.removeWhere((tod) => tod.id == id);
    });
  }

  void _startNewTodo(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return TodoInput(_addTodo);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.1,
              0.3,
              0.7,
              1
            ],
                colors: [
              Colors.green,
              Colors.blue,
              Colors.orange,
              Colors.pink
            ])),
        width: double.infinity,
        child: Column(
          children: [
            TodoList(_todo, _deleteTodo),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _startNewTodo(context);
        },
      ),
    );
  }
}
