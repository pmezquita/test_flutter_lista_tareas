import 'package:flutter/material.dart';

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
      // toolbarHeight: 400,
      // backgroundColor: Colors.transparent,
      // flexibleSpace: const Fondo(color1: primary20, color2: primary40, color3: primary60, maxHeight: 80),
      leading: (showBack)
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onPressedBack ?? () {},
            )
          : const SizedBox.shrink(),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
