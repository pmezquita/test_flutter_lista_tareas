import 'package:flutter/material.dart';
import 'package:lista_tareas/helpers/constants.dart';
import 'package:lista_tareas/presentation/pages/login/login_page.dart';
import 'package:lista_tareas/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme().theme(),
      home: const LoginPage(),
    );
  }
}
