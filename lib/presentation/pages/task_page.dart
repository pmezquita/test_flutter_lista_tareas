import 'package:flutter/material.dart';

import '../../models/task_model.dart';
import '../widgets/global/appbar.dart';

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
              children: <Widget>[
                const SizedBox(height: 40.0),
                Text(
                  tarea.titulo,
                  style: tema.headlineLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
