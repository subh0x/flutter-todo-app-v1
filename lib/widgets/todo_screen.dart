import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_card.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

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
        body: const TodoCard(),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {},
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ));
  }
}
