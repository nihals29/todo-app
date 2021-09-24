import 'package:flutter/material.dart';
import 'package:todo_rev1/data/todoList.dart';
import 'package:todo_rev1/models/models.dart';
import 'package:todo_rev1/widgets/todocards.dart';

class builder_todolist extends StatefulWidget {
  builder_todolist({
    Key? key,
  }) : super(key: key);

  @override
  _builder_todolistState createState() => _builder_todolistState();
}

class _builder_todolistState extends State<builder_todolist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todocard_list.length,
        itemBuilder: (_, int index) {
          return todoCard(todoitem: todocard_list[index]);
        });
  }
}
