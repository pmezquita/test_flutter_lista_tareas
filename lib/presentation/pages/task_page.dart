import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_tareas/presentation/widgets/global/decoration_field.dart';
import 'package:lista_tareas/presentation/widgets/task/avatar_task.dart';
import 'package:lista_tareas/presentation/widgets/task/button_task.dart';
import 'package:lista_tareas/theme/app_theme.dart';

import '../../models/task_model.dart';
import '../widgets/global/appbar.dart';
import '../widgets/global/label_field.dart';
import '../widgets/task/button_task_update.dart';

class TaskPage extends StatelessWidget {
  final Task tarea;

  const TaskPage({Key? key, required this.tarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'New Task',
        showBack: true,
        onPressedBack: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                AvatarTask(imgB64: tarea.imgB64, radius: 70),
                const SizedBox(height: 10.0),
                Text(
                  tarea.imgB64.isEmpty ? 'Click para abrir galería' : 'Click para cambiar imagen',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12),
                ),
                Padding(
                  padding: myPaddingForm,
                  child: Column(
                    children: [
                      const LabelField(label: 'Título'),
                      TextFormField(
                        initialValue: tarea.titulo,
                        enabled: !tarea.completada,
                        decoration: textFieldDecoration(hint: 'Escribe aquí el título de tu tarea'),
                      ),
                      const LabelField(label: 'Descripción'),
                      TextFormField(
                        initialValue: tarea.descripcion,
                        enabled: !tarea.completada,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: textFieldDecoration(hint: 'Describe cómo será tu tarea'),
                      ),
                      const LabelField(label: 'Fecha'),
                      _rowFecha(),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                tarea.isNew
                    ? const SizedBox.shrink()
                    : ButtonTaskUpdate(text: 'Actualizar', onPressed: () => Navigator.pop(context)),
                ButtonTask(text: 'Crear', icon: Icons.check, onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowFecha() => Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: tarea.dia?.toString(),
              enabled: !tarea.completada,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: textFieldDecoration(hint: 'Día'),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: TextFormField(
              initialValue: tarea.mes?.toString(),
              enabled: !tarea.completada,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: textFieldDecoration(hint: 'Mes'),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: TextFormField(
              initialValue: tarea.anio?.toString(),
              enabled: !tarea.completada,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: textFieldDecoration(hint: 'Año'),
            ),
          ),
        ],
      );
}
