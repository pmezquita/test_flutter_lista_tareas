import 'package:flutter/material.dart';
import 'package:lista_tareas/helpers/constants.dart';
import 'package:lista_tareas/presentation/pages/home_page.dart';
import 'package:lista_tareas/presentation/pages/login_page.dart';
import 'package:lista_tareas/presentation/pages/singin_page.dart';
import 'package:lista_tareas/presentation/pages/task_page.dart';
import 'package:lista_tareas/theme/app_theme.dart';

import 'models/task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tarea = Task.foo();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme().theme(),
      // home: LoginPage(),
      // home: SinginPage(),
      // home: HomePage(),
      home: TaskPage(tarea: tarea),
    );
  }
}
