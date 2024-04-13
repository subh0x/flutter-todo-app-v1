import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(6, 6, 8, 1.0),
        cardColor: const Color.fromRGBO(26, 27, 30, 1.0),
        primaryColor: const Color.fromRGBO(251, 184, 116, 1.0),
        hintColor: const Color.fromRGBO(171, 174, 185, 1.0),
      ),
      home: const ToDoScreen(),
    );
  }
}
