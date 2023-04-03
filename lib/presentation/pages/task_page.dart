import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/task/avatar_task.dart';

import '../../models/task_model.dart';
import '../widgets/global/appbar.dart';
import '../widgets/global/button_principal.dart';
import '../widgets/global/field.dart';
import '../widgets/global/label_field.dart';

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
                const SizedBox(height: 40.0),
                AvatarTask(imgB64: '', radius: 70),
                const SizedBox(height: 10.0),
                Text(
                  'Click para abrir galería',
                  style: Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(fontSize: 12),
                ),
                const LabelField(label: 'Título'),
                const Field(
                  textValue: '',
                  hint: 'Escribe aquí el título de tu tarea',
                ),
                const LabelField(label: 'Descripción'),
                const Field(
                  textValue: '',
                  hint: 'Describe cómo será tu tarea',
                  keyboardType: TextInputType.multiline,
                ),
                const LabelField(label: 'Fecha'),
                _rowFecha(),
                const Expanded(child: SizedBox.shrink()),
                ButtonPrincipal(
                  text: 'Crear',
                  icon: Icons.check,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowFecha() => Row(
        children: const [
          Expanded(
            child: Field(
              textValue: '',
              hint: 'Día',
              digitsOnly: true,
            ),
          ),
          Expanded(
            child: Field(
              textValue: '',
              hint: 'Mes',
              digitsOnly: true,
            ),
          ),
          Expanded(
            child: Field(
              textValue: '',
              hint: 'Año',
              digitsOnly: true,
            ),
          ),
        ],
      );
}
