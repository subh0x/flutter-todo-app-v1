import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_card.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  // Currently using a List of TodoItems to manage the ToDo List
  List<TodoItem> todoItems = [
    TodoItem(
        todoTitle: 'Task-1',
        todoDesc:
            'Work on Task-1: Build a Todo App using Flutter with very basic functionalities.'),
    TodoItem(todoTitle: 'Task-2', todoDesc: 'Description-2'),
    TodoItem(todoTitle: 'Task-3', todoDesc: 'Description-3')
  ];

  void addTodoItem() {
    setState(() {
      todoItems.add(
        TodoItem(
          todoTitle: 'New Task',
          todoDesc: 'New Description',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: false,
          title: Container(
              width: 120,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  Icon(Icons.check_box_outlined),
                  Text(
                    "Todo list",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              )),
        ),
        body: TodoCard(todoItems: todoItems),
        floatingActionButton: FloatingActionButton.small(
          onPressed: addTodoItem,
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ));
  }
}
