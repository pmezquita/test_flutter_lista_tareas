import 'package:flutter/material.dart';
import 'package:lista_tareas/theme/app_theme.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onPressedBack;

  const MyAppBar({
    Key? key,
    required this.title,
    this.showBack = false,
    this.onPressedBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (showBack)
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onPressedBack ?? () {},
            )
          : const SizedBox.shrink(),
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
