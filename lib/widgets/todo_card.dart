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
  final List<TodoItem> todoItems;
  const TodoCard({super.key, required this.todoItems});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        // Returning a Constrained Box to make sure the Tasks don't overflow the Card.
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 300),
          child: Card(
            color: Theme.of(context).cardColor,
            child: SizedBox(
              child: ListTile(
                title: Text(
                  widget.todoItems[index].todoTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      decoration: widget.todoItems[index].completed
                          ? TextDecoration.lineThrough
                          : null,
                      decorationThickness: 2.0,
                      decorationColor: Colors.white),
                ),
                subtitle: Text(
                  widget.todoItems[index].todoDesc,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    decoration: widget.todoItems[index].completed
                        ? TextDecoration.lineThrough
                        : null,
                    decorationThickness: 2.0,
                    decorationColor: Theme.of(context).hintColor,
                  ),
                ),
                // CheckBox Icon to mark the Task as Done
                trailing: IconButton(
                  icon: Icon(
                    widget.todoItems[index].completed
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: const Color.fromRGBO(171, 174, 185, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      if (widget.todoItems[index].completed) {
                        widget.todoItems[index].completed = false;
                      } else {
                        widget.todoItems[index].completed = true;
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
