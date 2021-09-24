import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_rev1/data/todoList.dart';
import 'package:todo_rev1/models/todoItem.dart';
import 'package:todo_rev1/widgets/builder_todolist.dart';

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
      home: SafeArea(child: const MyHomePage(title: 'TODO REv1')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final taskcontroller = TextEditingController();
  final desccontroller = TextEditingController();

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
        title: Text(widget.title),
      ),
      body: builder_todolist(),
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
                    todocard_list.add(todoItem(
                        task: taskcontroller.text,
                        taskDesc: desccontroller.text,
                        index: todocard_list.length));
                    Navigator.pop(context);
                    taskcontroller.clear();
                    desccontroller.clear();
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
