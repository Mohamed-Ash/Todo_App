import 'package:flutter/material.dart';
import 'package:todo_todo_todo_todo/modules/screens/todo_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      home: TodoAppLayOut(),
    );
  }
}


