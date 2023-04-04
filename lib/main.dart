import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_tareas/helpers/constants.dart';
import 'package:lista_tareas/router/my_go_router.dart';
import 'package:lista_tareas/theme/app_theme.dart';

import 'bloc/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: AppTheme().theme(),
        routerConfig: myGoRouter,
      ),
    );
  }
}
