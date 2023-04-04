import 'package:lista_tareas/db/user_db.dart';

class UserModel {
  int? id;
  String? username;
  String? password;

  UserModel();

  UserModel.full({this.id, required this.username, required this.password});

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    username = map[columnUsername];
    password = map[columnPassword];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      columnUsername: username,
      columnPassword: password,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}
