import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/home/bottom_navbar.dart';

import '../widgets/global/appbar.dart';
import '../widgets/home/fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Home'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Fab(onPressed: () => {}),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 0),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
