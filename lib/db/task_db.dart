import 'package:lista_tareas/db/provider.dart';

import '../models/task_model.dart';

const String tableTask = 'task';
const String columnId = '_id';
const String columnTitulo = 'titulo';
const String columnDescripcion = 'descripcion';
const String columnFecha = 'fecha';
const String columnFechaCompleted = 'fecha_completed';
const String columnCompletada = 'completada';
const String columnImagen = 'imagen';
const String columnCreatedBy = 'created_by';

const String createTableTask = '''
  create table $tableTask ( 
    $columnId integer primary key autoincrement, 
    $columnTitulo text not null,
    $columnDescripcion text not null,
    $columnFecha text not null,
    $columnFechaCompleted text,
    $columnImagen blob,
    $columnCreatedBy integer not null,
    $columnCompletada integer not null)
''';

class TaskDb {
  static Future<int> insert(Task task) async {
    final db = await DBProvider.db.database;
    return await db.insert(tableTask, task.toMap());
  }

  static Future<Task?> getTask(int id) async {
    final db = await DBProvider.db.database;
    List<Map<String, dynamic>> maps = await db.query(tableTask, where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first);
    }
    return null;
  }

  static Future<List<Task>?> getTaskType(int completada, int? createdBy) async {
    final db = await DBProvider.db.database;
    List<Map<String, dynamic>> maps = await db.query(
      tableTask,
      where: '$columnCompletada = ? AND $columnCreatedBy = ?',
      whereArgs: [completada, createdBy ?? 0],
    );
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
