import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Controller/todo_controller.dart';
import 'package:todo_app/Screens/add_todo_screen.dart';
import 'package:todo_app/Widgets/search_item.dart';

import '../Model/todo_Model.dart';
import '../Widgets/todo_item.dart';

enum FilterOptions {
  Az,
  New
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.Az) {
                context.read<TodoController>().sortAZ();
              } else {
                context.read<TodoController>().sortNew();
              }
            });
          },
          icon: Icon(
            Icons.menu,
          ),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('A-Z'),
              value: FilterOptions.Az,
            ),
            PopupMenuItem(
              child: Text('New'),
              value: FilterOptions.New,
            ),
          ],
        ),
        title: Text('Todo App'),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: Search(),
                );
              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(AddTodoScreen.routeName);
              },
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: ListView.builder(
          itemCount: todo.allTodo.length,
          itemBuilder: (ctx, i) => TodoList(
            todo: todo.allTodo[i],
          )
      ),
    );
  }
}
class Search extends SearchDelegate{
  List<String> todosList = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }else{
          query = '';
        }
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = todosList.where((element){
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
        itemBuilder: (context, index) => SearchList()
    );
  }
}

