import 'package:flutter/material.dart';
import 'package:lista_tareas/theme/app_theme.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: primary40,
      title: Text(
        title,
        style: Theme.of(context).primaryTextTheme.titleMedium,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
