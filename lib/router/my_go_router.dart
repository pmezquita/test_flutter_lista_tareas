import 'package:go_router/go_router.dart';
import 'package:lista_tareas/models/task_model.dart';
import 'package:lista_tareas/presentation/pages/home_page.dart';
import 'package:lista_tareas/presentation/pages/login_page.dart';
import 'package:lista_tareas/presentation/pages/singin_page.dart';
import 'package:lista_tareas/presentation/pages/task_page.dart';

final myGoRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/singin',
      name: 'singin',
      builder: (context, state) => const SinginPage(),
    ),
    GoRoute(
      path: '/home/:idUser',
      name: 'home',
      builder: (context, state) => HomePage(idUser: state.params['idUser']??'0'),
    ),
    GoRoute(
      path: '/task:idUser',
      name: 'taskView',
      builder: (context, state) {
        final tarea = state.extra as Task?;

        if (tarea == null) {
          return const LoginPage();
        } else {
          return TaskPage(tarea: tarea, idUser: state.params['idUser']?? '0');
        }
      },
    ),
  ],
);
