import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/todo_controller.dart';
import '../Model/todo_Model.dart';


class EditTodoScreen extends StatefulWidget {
  static const routeName = '/edit';

  const EditTodoScreen({Key? key}) : super(key: key);

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  String get productId => ModalRoute.of(context)?.settings.arguments as String;
  TodoController get _controller => context.read<TodoController>();
  Todo get loadedProduct =>
      context.read<TodoController>().findById(productId)!;

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      titleController.text = loadedProduct.title ?? '';
      descController.text = loadedProduct.description! ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Title không được trống';
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Description không được trống';
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                      _controller.edit(Todo(
                      id: productId,
                      title: titleController.text,
                      description: descController.text,
                      dateTime: DateTime.now()
                    ));
                    Navigator.pop(context);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
