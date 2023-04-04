import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/models/task_model.dart';
import 'package:lista_tareas/presentation/widgets/home/bottom_navbar.dart';
import 'package:lista_tareas/presentation/widgets/home/card_task.dart';

import '../widgets/global/appbar.dart';
import '../widgets/home/fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tarea = Task.foo();
    final list = [tarea, tarea, tarea, tarea, tarea, tarea, tarea, tarea, tarea, tarea];

    return Scaffold(
      appBar: const MyAppBar(title: 'Home'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Fab(onPressed: () => context.pushNamed('taskView',extra: Task())),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 0),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(_taskList(list))),
        ],
      ),
    );
  }
}

List<Widget> _taskList(List<Task> tareas) {
  return tareas.map((e) => CardTask(tarea: e)).toList();
}
