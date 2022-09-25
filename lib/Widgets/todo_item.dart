import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/todo_Model.dart';
import 'package:todo_app/Screens/chitiet_Screen.dart';

import '../Controller/todo_controller.dart';
import '../Screens/edit_todo_screen.dart';



class TodoList extends StatefulWidget {
  const TodoList({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  State<TodoList> createState() => _TodoItemTileState();
}

var formatter = new DateFormat('dd-MM-yyyy');

class _TodoItemTileState extends State<TodoList> {
  TodoController get _readProduct => context.read<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text ('${widget.todo.title}'),
            subtitle: Text('Date: ${formatter.format(widget.todo.dateTime)}'),
            trailing: SizedBox(
              width: 96,
              child: Row(
                children: [
                  IconButton(
                      onPressed: ()=> Navigator.pushNamed(
                    context,
                    EditTodoScreen.routeName,
                    arguments: widget.todo.id,
                  ),
                      icon: Icon(Icons.edit)
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Remove ${widget.todo.title}'),
                            content: const Text('You sure want to remove this todo?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _readProduct.remove('${widget.todo.id}');
                                  Navigator.pop(context); // dismiss dialog
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.delete_forever)
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.of(context).pushNamed(
                  ChiTiet.routeName,
                  arguments: widget.todo.id,
              );
            },
          ),
        ],
      ),
    );
  }
}
