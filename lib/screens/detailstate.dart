import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_rev1/models/todoItem.dart';

class detailstate extends StatelessWidget {
  final todoItem todoitem;
  const detailstate({required this.todoitem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: Hero(
          tag: 'todoItem${todoitem.index}',
          child: Card(
              elevation: 3,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                height: 220,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close))),
                          Expanded(
                            child: Center(
                              child: Text(
                                todoitem.task,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        //height: 100,
                        width: double.infinity,
                        child: Text(
                          todoitem.taskDesc,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      )),
    );
  }
}
