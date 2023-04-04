import 'package:lista_tareas/db/task_db.dart';
import 'package:lista_tareas/db/user_db.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => _database ?? await initDB();

  initDB() async {
    final databasesPath = await getDatabasesPath();
    String path = '$databasesPath/task.db';

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await _onCreateDB(db);
      },
    );
  }

  Future<void> _onCreateDB(Database db) async {
    await db.execute(createTableUser);
    await db.execute(createTableTask);
  }
}
