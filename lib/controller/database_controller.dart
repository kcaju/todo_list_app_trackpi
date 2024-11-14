import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController with ChangeNotifier {
  static late Database database;
  List<Map> myDatalist = [];
  List<Map> completedTasks = [];
  List<Map> pendindTasks = [];

  static Future<void> initDB() async {
    database = await openDatabase(
      'myDb.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, priority TEXT, status TEXT)');
      },
    );
  }

  Future<void> getData() async {
    List<Map> list = await database
        .rawQuery('SELECT * FROM Tasks WHERE status != "Completed"');

    myDatalist = list;
    notifyListeners();
  }

  Future<void> getCompletedTasks() async {
    List<Map> list = await database
        .rawQuery('SELECT * FROM Tasks WHERE status = "Completed"');
    completedTasks = list;
    notifyListeners();
  }

  Future<void> getPendingTasks() async {
    List<Map> list =
        await database.rawQuery('SELECT * FROM Tasks WHERE status = "Pending"');
    pendindTasks = list;
    notifyListeners();
  }

  Future<void> addTask({
    required String title,
    required String priority,
    required String description,
    required String status,
  }) async {
    await database.rawInsert(
        'INSERT INTO Tasks(title, description, priority, status) VALUES (?,?,?,?)',
        [title, description, priority, status]);

    await getData();
  }

  Future<void> deleteTask({required var id}) async {
    await database.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]);

    await getData();
    await getCompletedTasks();
    notifyListeners();
  }

  Future<void> updateTask({required String status, required var id}) async {
    await database
        .rawUpdate('UPDATE Tasks SET status = ? WHERE id = ?', [status, id]);
    await getData();
    await getCompletedTasks();
    await getPendingTasks();
    notifyListeners();
  }
}
