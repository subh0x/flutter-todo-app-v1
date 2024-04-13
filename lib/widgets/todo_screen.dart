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
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void addTodoItem(String taskTitle, String taskDesc) {
    if (taskTitle.isNotEmpty && taskDesc.isNotEmpty) {
      setState(() {
        todoItems.insert(
          0, // Inserting New To-do at First Position LIFO (Last In, First Out)
          TodoItem(
            todoTitle: taskTitle,
            todoDesc: taskDesc,
          ),
        );
      });
    }
  }

  // Changing the Visibility of Container and the Floating Action button
  bool _isContainerVisible = false;
  bool _isFloatingButtonEnabled = true;

  void _changeFloatingButtonVisbility() {
    setState(() {
      _isFloatingButtonEnabled = !_isFloatingButtonEnabled;
    });
  }

  void _changeContainerVisiblity() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
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
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(children: [
          TodoCard(todoItems: todoItems),
          if (_isContainerVisible)
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 55),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleController,
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        labelText: 'Title',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _descController,
                      minLines: 1,
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton.icon(
                      onPressed: () {
                        addTodoItem(
                            _titleController.text, _descController.text);
                        _changeFloatingButtonVisbility();
                        _changeContainerVisiblity();
                      },
                      icon: const Icon(Icons.add_box_rounded),
                      label: const Text("Add Todo"),
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor),
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).scaffoldBackgroundColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ]),
      ),
      floatingActionButton: _isFloatingButtonEnabled
          ? FloatingActionButton.small(
              onPressed: () {
                _changeContainerVisiblity();
                _changeFloatingButtonVisbility();
              },
              foregroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
