import 'package:flutter/material.dart';
import 'package:todo_rev1/Screens/detailstate.dart';
import 'package:todo_rev1/models/todoItem.dart';
import 'package:todo_rev1/widgets/remove_todocard.dart';

class todoCard extends StatelessWidget {
  final todoItem todoitem;
  const todoCard({Key? key, required this.todoitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => detailstate(
                      todoitem: todoitem,
                    )));
      },
      child: SizedBox(
        child: Hero(
          tag: 'todoItem${todoitem.index}',
          child: Card(
              elevation: 3,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                              child: Icon(Icons.check)),
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
                              onPressed: () {                                
                                remove_todocard(todoitem.index);
                              },
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
      ),
    );
  }
}
