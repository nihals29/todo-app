import 'package:flutter/material.dart';
import 'package:todo_rev1/data/todoList.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
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
    
      _save() async {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/my_file.txt');
        final text = 'Hello World!';
        await file.writeAsString(text);
        print('saved');
      }
    return ListView.builder(
        itemCount: todocard_list.length,
        itemBuilder: (_, int index) {
          return todoCard(todoitem: todocard_list[index]);
        });
  }
}

//read and write the file 
//next: update the file and data in the fire base


//  _read() async {
//         try {
//           final directory = await getApplicationDocumentsDirectory();
//           final file = File('${directory.path}/my_file.txt');
//           String text = await file.readAsString();
//           print(text);
//         } catch (e) {
//           print("Couldn't read file");
//         }
//       }
      
//       _save() async {
//         final directory = await getApplicationDocumentsDirectory();
//         final file = File('${directory.path}/my_file.txt');
//         final text = 'Hello World!';
//         await file.writeAsString(text);
//         print('saved');
//       }