import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_rev1/data/todoList.dart';
import 'package:todo_rev1/models/todoItem.dart';
import 'package:todo_rev1/taskdata.dart';
import 'package:todo_rev1/widgets/builder_todolist.dart';

import 'data/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: SafeArea(child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final taskcontroller = TextEditingController();
  final desccontroller = TextEditingController();
  DatabaseHelper _databaseHelper = DatabaseHelper();
  builder_todolist buildertodo = builder_todolist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            //thememode
          },
        ),
        title: Text("TODO-app"),
      ),
      body: Scaffold(
        body: builder_todolist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showdialog,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("New task"),
          backgroundColor: Colors.blueGrey,
          content: Container(
            width: double.infinity,
            height: 200,
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Task Title:"),
                  controller: taskcontroller,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Task Desc:"),
                  controller: desccontroller,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue)),
                onPressed: () {
                  setState(() {
                   // builder_todolist(task: task, taskDesc: taskDesc));
                    Navigator.pop(context);
                    taskcontroller.clear();
                    desccontroller.clear();
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => builder_todolist()));
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text(
                    "Add tasks",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ))
          ],
        );
      },
    );
  }
}
