import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_rev1/models/models.dart';

class DatabaseHelper {
  Future<Database> database() async => openDatabase(
        join(await getDatabasesPath(), 'todo_tasks.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT, taskDesc TEXT)',
          );
        },
        version: 1,
      );

  Future<int> insertTasks(todoItem todoitem) async {
    
    Database db = await database();

     int taskId = 0;
    Database _db = await database();
    await _db.insert('tasks', todoitem.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
      taskId = value;
    });
    return taskId;
  }

   Future<List<todoItem>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> maps = await _db.query('tasks');
    return List.generate(maps.length, (i) {
      return todoItem(
        index: maps[i]['id'],
        task: maps[i]['task'],
        taskDesc: maps[i]['taskDesc'],
      );
    });
  }


}
