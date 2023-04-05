import 'package:lista_tareas/db/provider.dart';

import '../models/task_model.dart';

const String tableTask = 'task';
const String columnId = '_id';
const String columnTitulo = 'titulo';
const String columnDescripcion = 'descripcion';
const String columnFecha = 'fecha';
const String columnCompletada = 'completada';
const String columnImagen = 'imagen';

const String createTableTask = '''
  create table $tableTask ( 
    $columnId integer primary key autoincrement, 
    $columnTitulo text not null,
    $columnDescripcion text not null,
    $columnFecha text not null,
    $columnImagen blob,
    $columnCompletada integer not null)
''';

class TaskDb {
  static Future<Task> insert(Task task) async {
    final db = await DBProvider.db.database;
    task.id = await db.insert(tableTask, task.toMap());
    return task;
  }

  static Future<Task?> getTask(int id) async {
    final db = await DBProvider.db.database;
    List<Map<String, dynamic>> maps = await db.query(tableTask, where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first);
    }
    return null;
  }

  static Future<List<Task>?> getTaskType(int completada) async {
    final db = await DBProvider.db.database;
    List<Map<String, dynamic>> maps =
        await db.query(tableTask, where: '$columnCompletada = ?', whereArgs: [completada]);
    if (maps.isNotEmpty) {
      return Task.fromListMap(maps);
    }
    return null;
  }

  static Future<int> delete(int id) async {
    final db = await DBProvider.db.database;
    return await db.delete(tableTask, where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<int> update(Task task) async {
    final db = await DBProvider.db.database;
    return await db.update(tableTask, task.toMap(), where: '$columnId = ?', whereArgs: [task.id]);
  }

  static Future close() async {
    final db = await DBProvider.db.database;
    return db.close();
  }
}
