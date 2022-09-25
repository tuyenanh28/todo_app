import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/todo_Model.dart';
import 'package:todo_app/Screens/chitiet_Screen.dart';

import '../Controller/todo_controller.dart';
import '../Screens/edit_todo_screen.dart';



class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);


  @override
  State<SearchList> createState() => _SearchItemTileState();
}

var formatter = new DateFormat('dd-MM-yyyy');

class _SearchItemTileState extends State<SearchList> {
  Todo get _readProduct => context.read<Todo>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text ('${_readProduct?.title}'),
            onTap: (){
              Navigator.of(context).pushNamed(
                  ChiTiet.routeName,
                  arguments: _readProduct?.id,
              );
            },
          ),
        ],
      ),
    );
  }
}
