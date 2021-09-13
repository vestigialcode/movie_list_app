import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_list_app/models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function _deleteTodo;
  const TodoList(this.todos, this._deleteTodo);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).padding.top + kToolbarHeight),
        child: todos.length > 0
            ? ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Column(
                    children: [
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                          width: double.infinity,
                          child: Card(
                            elevation: 6,
                            child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Center(
                                        child: Text(
                                      '${todos[index].title}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                      ),
                                    )),
                                    Text(
                                      'Director: ${todos[index].items}',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    IconButton(
                                        onPressed: () =>
                                            _deleteTodo(todos[index].id),
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                )),
                          ))
                    ],
                  ));
                })
            : Center(
                child: Text(
                'Press the + icon \nto add your favourite movies',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )));
  }
}
