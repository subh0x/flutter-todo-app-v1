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
        scaffoldBackgroundColor: const Color.fromARGB(255, 6, 6, 8),
        cardColor: const Color.fromARGB(255, 26, 27, 30),
        primaryColor: const Color.fromRGBO(251, 184, 116, 1),
        hintColor: const Color.fromRGBO(171, 174, 185, 1),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(171, 174, 185, 1),
        ),
      ),
      home: ToDoScreen(),
    );
  }
}
