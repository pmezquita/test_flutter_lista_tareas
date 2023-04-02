import 'package:flutter/material.dart';
import 'package:lista_tareas/theme/app_theme.dart';

class ButtonPrincipal extends StatelessWidget {
  final String text;
  final bool? isPrimary;

  const ButtonPrincipal({Key? key, required this.text, this.isPrimary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      padding: myPaddingButton,
      child: _MyButton(text: text, isPrimary: isPrimary ?? true),
    );
  }
}

class _MyButton extends StatelessWidget {
  final String text;
  final bool isPrimary;

  const _MyButton({Key? key, required this.text, required this.isPrimary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: isPrimary
          ? Theme.of(context).elevatedButtonTheme.style
          : ElevatedButton.styleFrom(backgroundColor: secondary40),
      child: Text(text),
    );
  }
}
