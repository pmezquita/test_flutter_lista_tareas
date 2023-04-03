import 'package:flutter/material.dart';

import '../../models/task_model.dart';
import '../widgets/global/appbar.dart';
import '../widgets/global/field.dart';
import '../widgets/global/label_field.dart';

class TaskPage extends StatelessWidget {
  final Task tarea;

  const TaskPage({Key? key, required this.tarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).primaryTextTheme;
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
              children: const <Widget>[
                SizedBox(height: 40.0),
                LabelField(label: 'Título'),
                Field(
                  textValue: '',
                  hint: 'Escribe aquí el título de tu tarea',
                ),
                LabelField(label: 'Descripción'),
                Field(
                  textValue: '',
                  hint: 'Describe cómo será tu tarea',
                  keyboardType: TextInputType.multiline,
                ),
                LabelField(label: 'Fecha'),
                Field(
                  textValue: '',
                  hint: 'Día',
                  digitsOnly: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
