import 'package:flutter/material.dart';
import 'package:lista_tareas/theme/app_theme.dart';

class ButtonPrincipal extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback? onPressed;

  const ButtonPrincipal({
    Key? key,
    required this.text,
    this.isPrimary = true,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: isPrimary
          ? Theme.of(context).elevatedButtonTheme.style
          : ElevatedButton.styleFrom(backgroundColor: secondary40),
      label: Text(text, style: Theme.of(context).primaryTextTheme.displaySmall?.copyWith(color: Colors.white)),
      icon: (icon != null) ? Icon(icon) : const SizedBox.shrink(),
    );
  }
}
