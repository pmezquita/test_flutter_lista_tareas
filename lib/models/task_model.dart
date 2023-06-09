import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_tareas/db/task_db.dart';

class Task {
  int? id;
  Uint8List? img;
  String? titulo;
  String? descripcion;
  DateTime? fecha;
  DateTime? fechaCompleted;
  int? dia;
  int? mes;
  int? anio;
  bool completada;
  int? createdBy;

  Task({
    this.id,
    this.titulo,
    this.descripcion,
    this.fecha,
    this.fechaCompleted,
    this.dia,
    this.mes,
    this.anio,
    this.img,
    this.completada = false,
    this.createdBy,
  });

  Task.fechaDate({
    String? titulo,
    String? descripcion,
    DateTime? fecha,
    DateTime? fechaCompleted,
    int? id,
    Uint8List? img,
    bool? completada,
    int? createdBy,
  }) : this(
          id: id,
          titulo: titulo,
          descripcion: descripcion,
          fecha: fecha,
          dia: fecha?.day,
          mes: fecha?.month,
          anio: fecha?.year,
          fechaCompleted: fechaCompleted,
          img: img,
          completada: completada ?? false,
          createdBy: createdBy,
        );

  String get formatDate => fecha == null ? '- - -' : DateFormat('dd/MM/yy').format(fecha!);

  bool get isNew => id == null;

  bool get isEditable => !completada;

  void setCompleted() {
    fechaCompleted = DateTime.now();
    completada = true;
  }

  Task copyWith({
    int? id,
    Uint8List? img,
    String? titulo,
    String? descripcion,
    DateTime? fecha,
    DateTime? fechaCompleted,
    bool? completada,
    int? createdBy,
  }) =>
      Task.fechaDate(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        fecha: fecha ?? this.fecha,
        fechaCompleted: fechaCompleted ?? this.fechaCompleted,
        img: img ?? this.img,
        completada: completada ?? this.completada,
        createdBy: createdBy ?? this.createdBy,
      );

  Task.fromMap(Map<String, dynamic> map)
      : this.fechaDate(
          id: map[columnId],
          titulo: map[columnTitulo],
          descripcion: map[columnDescripcion],
          fecha: DateTime.parse(map[columnFecha]),
          fechaCompleted: map[columnFechaCompleted] != null ? DateTime.tryParse(map[columnFechaCompleted]) : null,
          completada: map[columnCompletada] == 1,
          img: map[columnImagen],
          createdBy: map[columnCreatedBy],
        );

  static List<Task> fromListMap(List<Map<String, dynamic>> maps) {
    return maps.map((e) => Task.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      columnTitulo: titulo,
      columnDescripcion: descripcion,
      columnFecha: fecha?.toIso8601String(),
      columnFechaCompleted: fechaCompleted?.toIso8601String(),
      columnCompletada: completada ? 1 : 0,
      columnImagen: img,
      columnCreatedBy: createdBy,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  static List<DropdownMenuItem<int>> getDropdownDia(int year, int month) {
    final lastDay = DateTime(year, month + 1, 0).day;
    return List.generate(
        lastDay, (index) => DropdownMenuItem<int>(value: index + 1, child: Text((index + 1).toString())));
  }

  static List<DropdownMenuItem<int>> getDropdownMes() {
    List<DropdownMenuItem<int>> list = [];
    mesesMap.forEach((key, value) {
      list.add(DropdownMenuItem(value: key, child: Text(value)));
    });
    return list;
  }

  static const mesesMap = {
    1: 'Enero',
    2: 'Febrero',
    3: 'Marzo',
    4: 'Abril',
    5: 'Mayo',
    6: 'Junio',
    7: 'Julio',
    8: 'Agosto',
    9: 'Septiembre',
    10: 'Octubre',
    11: 'Noviembre',
    12: 'Diciembre',
  };

  static List<DropdownMenuItem<int>> getDropdownAnio(int year) {
    final currentYear = DateTime.now().year;
    final initYear = year < DateTime.now().year ? year : currentYear;
    return List.generate(
        50, (index) => DropdownMenuItem(value: initYear + index, child: Text((initYear + index).toString())));
  }
}
