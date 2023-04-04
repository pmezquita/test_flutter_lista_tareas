import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/global/button_principal.dart';

import '../../../theme/app_theme.dart';

class AlertDialog2Opt extends StatelessWidget {
  final String title;
  final String content;
  final String? opt1Text;
  final String? opt2Text;
  final VoidCallback? onPressed1Opt;
  final VoidCallback? onPressed2Opt;

  const AlertDialog2Opt(
      {Key? key,
      required this.title,
      required this.content,
      this.opt1Text,
      this.opt2Text,
      this.onPressed1Opt,
      this.onPressed2Opt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).primaryTextTheme;
    return AlertDialog(
      backgroundColor: primary90,
      title: Text(title, style: tema.bodyMedium, textAlign: TextAlign.center),
      content: Text(content, style: tema.headlineMedium, textAlign: TextAlign.center),
      actions: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _ButtonAlert(isPrimary: false, text: 'No', onPressed: onPressed1Opt)),
            Expanded(child: _ButtonAlert(text: 'Sí', onPressed: onPressed2Opt)),
          ],
        ),
      ],
    );
  }
}

class _ButtonAlert extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback? onPressed;

  const _ButtonAlert({
    Key? key,
    required this.text,
    this.isPrimary = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = isPrimary
        ? Theme.of(context).primaryTextTheme.displaySmall?.copyWith(color: Colors.white)
        : Theme.of(context).primaryTextTheme.displaySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: isPrimary
            ? Theme.of(context).elevatedButtonTheme.style
            : ElevatedButton.styleFrom(
                textStyle: textStyle,
                foregroundColor: secondary40,
                backgroundColor: secondary90,
                side: const BorderSide(color: secondary40),
              ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
