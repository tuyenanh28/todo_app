import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Screens/chitiet_Screen.dart';
import 'Controller/todo_controller.dart';
import 'Screens/add_todo_screen.dart';
import 'Screens/edit_todo_screen.dart';
import 'Screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoController()),
        ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          AddTodoScreen.routeName: (ctx) => const AddTodoScreen(),
          ChiTiet.routeName: (ctx) => const ChiTiet(),
          EditTodoScreen.routeName: (ctx) => const EditTodoScreen(),
        },
      ),
    );
  }
}

