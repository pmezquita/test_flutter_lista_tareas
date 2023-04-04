import 'package:lista_tareas/db/provider.dart';

import '../models/user_model.dart';

const String tableUser = 'user';
const String columnId = '_id';
const String columnUsername = 'username';
const String columnPassword = 'password';

const String createTableUser = '''
  create table $tableUser ( 
    $columnId integer primary key autoincrement, 
    $columnUsername text not null,
    $columnPassword text not null)
''';

class UserDb {

  Future<UserModel> insert(UserModel user) async {
    final db = await DBProvider.db.database;
    user.id = await db.insert(tableUser, user.toMap());
    return user;
  }

  Future<UserModel?> getUser(int id) async {
    final db = await DBProvider.db.database;
    List<Map<String, dynamic>> maps = await db.query(tableUser,
        where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    final db = await DBProvider.db.database;
    return await db.delete(tableUser, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(UserModel user) async {
    final db = await DBProvider.db.database;
    return await db.update(tableUser, user.toMap(), where: '$columnId = ?', whereArgs: [user.id]);
  }

  Future close() async {
    final db = await DBProvider.db.database;
    return db.close();
  }
}
