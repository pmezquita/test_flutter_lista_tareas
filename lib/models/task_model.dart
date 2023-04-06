import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:lista_tareas/db/task_db.dart';

class Task {
  int? id;
  Uint8List? img;
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
    this.img,
    this.completada = false,
  });

  Task.fechaDate({
    String? titulo,
    String? descripcion,
    DateTime? fecha,
    int? id,
    Uint8List? img,
    bool? completada,
  }) : this(
          id: id,
          titulo: titulo,
          descripcion: descripcion,
          fecha: fecha,
          dia: fecha?.day,
          mes: fecha?.month,
          anio: fecha?.year,
          img: img,
          completada: completada ?? false,
        );

  String get formatDate => fecha == null ? '- - -' : DateFormat('dd/MM/yy').format(fecha!);

  bool get isNew => id == null;

  bool get isEditable => !completada;

  Task copyWith({
    int? id,
    Uint8List? img,
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
        img: img ?? this.img,
        completada: completada ?? this.completada,
      );

  Task.fromMap(Map<String, dynamic> map)
      : this.fechaDate(
          id: map[columnId],
          titulo: map[columnTitulo],
          descripcion: map[columnDescripcion],
          fecha: DateTime.parse(map[columnFecha]),
          completada: map[columnCompletada] == 1,
          img: map[columnImagen],
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
      columnImagen: img,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}
