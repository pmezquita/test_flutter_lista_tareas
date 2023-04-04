import 'package:intl/intl.dart';
import 'package:lista_tareas/helpers/constants.dart';

class Task {
  int id = 0;
  String imgB64 = '';
  String? titulo;
  String? descripcion;
  DateTime? fecha;
  int? dia;
  int? mes;
  int? anio;
  bool completada = false;

  Task();

  Task.min({required this.titulo, required this.descripcion, required this.fecha})
      : id = 1,
        dia = fecha!.day,
        mes = fecha.month,
        anio = fecha.year,
        imgB64 = fooImg;

  Task.foo()
      : this.min(
            titulo: 'Enviar documentación',
            descripcion:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            fecha: DateTime.now());

  String get formatDate => fecha == null ? '- - -' : DateFormat('dd/MM/yy').format(fecha!);

  bool get isNew => id == 0;
}
