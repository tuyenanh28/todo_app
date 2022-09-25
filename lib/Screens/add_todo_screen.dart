import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/todo_controller.dart';
import '../Model/todo_Model.dart';

class AddTodoScreen extends StatefulWidget {
  static const routeName = '/add-product';

  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TodoController get _controller => context.read<TodoController>();

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();

  /// random ngẫu nhiên id
  String generateRandomString() {
    final r = Random();
    const ac = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(6, (index) => ac[r.nextInt(ac.length)]).join();
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
                    _controller.addProduct(Todo(
                      id: generateRandomString(),
                      title: titleController.text,
                      description: descController.text,
                      dateTime: DateTime.now(),
                    ));
                    Navigator.pop(context);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Add',
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
