import 'package:intl/intl.dart';
import 'package:lista_tareas/db/task_db.dart';
import 'package:lista_tareas/helpers/constants.dart';

class Task {
  int? id;
  String imgB64 = '';
  String? titulo;
  String? descripcion;
  DateTime? fecha;
  int? dia;
  int? mes;
  int? anio;
  bool completada = false;

  Task();

  Task.min({required this.titulo, required this.descripcion, required this.fecha}) {
    id = 1;
    setFechaFullDate = fecha!;
    imgB64 = fooImg;
  }

  Task.foo()
      : this.min(
            titulo: 'Enviar documentación',
            descripcion:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            fecha: DateTime.now());

  String get formatDate => fecha == null ? '- - -' : DateFormat('dd/MM/yy').format(fecha!);

  set setFechaFullStr(String fecha) {
    final date = DateTime.parse(fecha);
    this.fecha = date;
    dia = date.day;
    mes = date.month;
    anio = date.year;
  }

  set setFechaFullDate(DateTime date) {
    fecha = date;
    dia = date.day;
    mes = date.month;
    anio = date.year;
  }

  bool get isNew => id == null;

  Task.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    titulo = map[columnTitulo];
    descripcion = map[columnDescripcion];
    setFechaFullStr = map[columnFecha];
    completada = map[columnCompletada];
  }

  static List<Task> fromListMap(List<Map<String, dynamic>> maps) {
    return maps.map((e) => Task.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      columnTitulo: titulo,
      columnDescripcion: descripcion,
      columnFecha: fecha,
      columnCompletada: completada,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}
