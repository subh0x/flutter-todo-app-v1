import 'package:flutter/material.dart';

class TodoItem {
  final String todoTitle;
  final String todoDesc;
  bool completed;

  TodoItem(
      {required this.todoTitle,
      required this.todoDesc,
      this.completed = false});
}

class TodoCard extends StatefulWidget {
  const TodoCard({super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  List<TodoItem> todoItems = [
    TodoItem(todoTitle: 'Task-1', todoDesc: 'Description-1'),
    TodoItem(todoTitle: 'Task-2', todoDesc: 'Description-2'),
    TodoItem(todoTitle: 'Task-3', todoDesc: 'Description-3')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Theme.of(context).cardColor,
          child: ListTile(
            title: Text(
              todoItems[index].todoTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  decoration: todoItems[index].completed ? TextDecoration.lineThrough : null,
                  decorationThickness: 2.0,
                  decorationColor: Colors.white
                  ),
            ),
            subtitle: Text(
              todoItems[index].todoDesc,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                decoration: todoItems[index].completed ? TextDecoration.lineThrough : null,
                decorationThickness: 2.0,
                decorationColor: Theme.of(context).hintColor,
              ),
            ),
            trailing: IconButton(
              icon:  Icon(todoItems[index].completed ? Icons.check_box : Icons.check_box_outline_blank),
              onPressed: () {
                setState(() {
                  if(todoItems[index].completed){
                    todoItems[index].completed = false;
                  }
                  else {
                    todoItems[index].completed = true;
                  }
                });
              },
            ),
          ),
        );
      },
    );
  }
}
