import 'package:flutter/material.dart';
import 'package:lista_tareas/helpers/constants.dart';
import 'package:lista_tareas/router/my_go_router.dart';
import 'package:lista_tareas/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme().theme(),
      routerConfig: myGoRouter,
    );
  }
}
