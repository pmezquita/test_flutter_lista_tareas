import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/bloc/home/home_bloc.dart';
import 'package:lista_tareas/db/task_db.dart';
import 'package:lista_tareas/models/task_model.dart';
import 'package:lista_tareas/presentation/widgets/home/card_task.dart';

import '../../theme/app_theme.dart';
import '../widgets/global/appbar.dart';
import '../widgets/home/fab.dart';

class HomePage extends StatelessWidget {
  final String idUser;

  const HomePage({Key? key, this.idUser = '0'})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Home'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          Fab(onPressed: () => context.pushNamed('taskView', extra: Task(), params: {'idUser': idUser})),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: (index) => BlocProvider.of<HomeBloc>(context).add(SetHomeEvent(index)),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.text_snippet_outlined, size: sizeIconBottomNavBar),
                activeIcon: Icon(Icons.text_snippet, size: sizeIconBottomNavBarSelected),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.check, size: sizeIconBottomNavBar),
                activeIcon: Icon(Icons.check_circle, size: sizeIconBottomNavBarSelected),
              ),
            ],
          );
        },
      ),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return _sliverTaskList(context, state.selectedIndex);
            },
          )
        ],
      ),
    );
  }

  Widget _sliverTaskList(BuildContext context, int selectedIndex) {
    final type = selectedIndex == 0 ? 0 : 1;
    return FutureBuilder<List<Task>?>(
        future: TaskDb.getTaskType(type, int.tryParse(idUser)),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data is List<Task>?) {
              final tareas = snapshot.data as List<Task>;
              return SliverList(delegate: SliverChildListDelegate(tareas.map((e) => CardTask(tarea: e)).toList()));
            }
            return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
          } else {
            return SliverToBoxAdapter(
                child: Center(
              child: Text(
                'Sin resultados',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ));
          }
        });
  }
}
