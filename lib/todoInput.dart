import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoInput extends StatefulWidget {
  final Function todo;
  TodoInput(this.todo);

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final _todoController = TextEditingController();
  final _titleController = TextEditingController();

  void _submitData() {
    widget.todo(_titleController.text, _todoController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Movie Name'),
            )),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: TextField(
            controller: _todoController,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: InputDecoration(labelText: 'Directors name'),
            onSubmitted: (_) {
              _submitData();
            },
          ),
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: _submitData,
            child: Text('Add to Watchlist',
                style: TextStyle(color: Colors.white))),
      ]),
    ));
  }
}
