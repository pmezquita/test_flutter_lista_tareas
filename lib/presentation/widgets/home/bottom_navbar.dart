import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  const BottomNavbar({Key? key, required this.selectedIndex, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sizeIcon = 30.0;
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.text_snippet_outlined, size: sizeIcon),
          activeIcon: Icon(Icons.text_snippet, size: sizeIcon),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.check, size: sizeIcon),
          activeIcon: Icon(Icons.check_circle, size: sizeIcon),
        ),
      ],
    );
  }
}
