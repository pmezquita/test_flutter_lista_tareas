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
    return Container(
      width: double.infinity,
      height: 100.0,
      padding: myPaddingButton,
      child: _MyButton(
        text: text,
        isPrimary: isPrimary,
        icon: icon,
        onPressed: onPressed ?? () {},
      ),
    );
  }
}

class _MyButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback onPressed;

  const _MyButton({
    Key? key,
    required this.text,
    required this.isPrimary,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: isPrimary
          ? Theme.of(context).elevatedButtonTheme.style
          : ElevatedButton.styleFrom(backgroundColor: secondary40),
      label: Text(text),
      icon: (icon != null) ? Icon(icon) : const SizedBox.shrink(),
    );
  }
}
