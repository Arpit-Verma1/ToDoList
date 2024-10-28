import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/todoProvider.dart';

class UpdateTodo extends StatefulWidget {
  final String title;
  final String description;
  final int index;

  const UpdateTodo(
      {super.key,
      required this.title,
      required this.description,
      required this.index});

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Update todo'),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: descriptionController,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Cancel"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<todoProvider>(context, listen: false)
                        .updateTodo(widget.index, titleController.text,
                            descriptionController.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Update"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
