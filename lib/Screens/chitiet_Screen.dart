import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/todo_Model.dart';

import '../Controller/todo_controller.dart';



class ChiTiet extends StatefulWidget {
  static const routeName = '/chitiet';
  const ChiTiet({Key? key}) : super(key: key);

  @override
  State<ChiTiet> createState() => _ChiTietState();
}


class _ChiTietState extends State<ChiTiet> {
  String get productId => ModalRoute.of(context)?.settings.arguments as String;
  Todo? get loadedProduct =>
      context.read<TodoController>().findById(productId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiet'),
      ),
      body: Text('${loadedProduct?.description}',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
