import 'package:go_router/go_router.dart';
import 'package:lista_tareas/models/task_model.dart';
import 'package:lista_tareas/presentation/pages/home_page.dart';
import 'package:lista_tareas/presentation/pages/login_page.dart';
import 'package:lista_tareas/presentation/pages/singin_page.dart';
import 'package:lista_tareas/presentation/pages/task_page.dart';

final myGoRouter = GoRouter(
  routes: [
    // TODO: eliminar este route
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login', // TODO: regresar a /
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/singin',
      name: 'singin',
      builder: (context, state) => const SinginPage(),
    ),
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   builder: (context, state) => const HomePage(),
    // ),
    GoRoute(
      path: '/task',
      name: 'taskView',
      builder: (context, state) {
        final tarea = state.extra as Task?;

        if (tarea == null) {
          return const HomePage();
        } else {
          return TaskPage(tarea: tarea);
        }
      },
    ),
  ],
);
