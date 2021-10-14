import 'package:flutter/material.dart';
import 'package:todo_rev1/data/database_helper.dart';

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
  DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: [],
        future: _databaseHelper.getTasks(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Container(
                child: Text("Loading"),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  _databaseHelper.insertTasks(todoItem(
                      task: this.tasktitle,
                      taskDesc: this.taskdesc,
                      index: index));
                  print(snapshot.data.length);
                  // return Card(child: Center(child: Text("asdasdas"),),);
                  return todoCard(
                      todoitem: todoItem(
                          task: snapshot.data[index].task,
                          taskDesc: snapshot.data[index].taskDesc,
                          index: snapshot.data[index].index));
                });
          }
        });
  }
}
