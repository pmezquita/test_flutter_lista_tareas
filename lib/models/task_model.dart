import 'package:intl/intl.dart';
import 'package:lista_tareas/db/task_db.dart';
import 'package:lista_tareas/helpers/constants.dart';

class Task {
  int? id;
  String? imgB64;
  String? titulo;
  String? descripcion;
  DateTime? fecha;
  int? dia;
  int? mes;
  int? anio;
  bool completada;

  Task({
    this.id,
    this.titulo,
    this.descripcion,
    this.fecha,
    this.dia,
    this.mes,
    this.anio,
    this.imgB64,
    this.completada = false,
  });

  Task.fechaDate({
    String? titulo,
    String? descripcion,
    DateTime? fecha,
    int? id,
    String? imgB64,
    bool? completada,
  }) : this(
          id: id,
          titulo: titulo,
          descripcion: descripcion,
          fecha: fecha,
          dia: fecha?.day,
          mes: fecha?.month,
          anio: fecha?.year,
          imgB64: imgB64,
          completada: completada ?? false,
        );

  Task.foo()
      : this.fechaDate(
          id: 1,
          titulo: 'Enviar documentación',
          descripcion:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          fecha: DateTime.now(),
          imgB64: fooImg,
        );

  String get formatDate => fecha == null ? '- - -' : DateFormat('dd/MM/yy').format(fecha!);

  bool get isNew => id == null;

  bool get isEditable => !completada;

  Task copyWith({
    int? id,
    String? imgB64,
    String? titulo,
    String? descripcion,
    DateTime? fecha,
    bool? completada,
  }) =>
      Task.fechaDate(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        fecha: fecha ?? this.fecha,
        imgB64: imgB64 ?? this.imgB64,
        completada: completada ?? this.completada,
      );

  Task.fromMap(Map<String, dynamic> map)
      : this.fechaDate(
          id: map[columnId],
          titulo: map[columnTitulo],
          descripcion: map[columnDescripcion],
          fecha: DateTime.parse(map[columnFecha]),
          completada: map[columnCompletada] == 1,
        );

  static List<Task> fromListMap(List<Map<String, dynamic>> maps) {
    return maps.map((e) => Task.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      columnTitulo: titulo,
      columnDescripcion: descripcion,
      columnFecha: fecha?.toIso8601String(),
      columnCompletada: completada ? 1 : 0,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}
