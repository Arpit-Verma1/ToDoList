import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/View/addTodoScreen.dart';
import 'package:todo/View/updateTodo.dart';
import 'package:todo/ViewModel/todoProvider.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context, builder: (context) => AddTodoScreen());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
          child: Consumer<todoProvider>(
              builder: (context, todoProvider, child) => todoProvider
                          .todos.length >
                      0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return UpdateTodo(
                                    index: index,
                                    title: todoProvider.todos[index].title!,
                                    description:
                                        todoProvider.todos[index].description!,
                                  );
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(todoProvider.todos[index].title!),
                                    Text(
                                        todoProvider.todos[index].description!),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      todoProvider.removeTodo(index);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: todoProvider.todos.length,
                    )
                  : Container(
                      child: Center(
                        child: Text('No Todos'),
                      ),
                    ))),
    );
  }
}
