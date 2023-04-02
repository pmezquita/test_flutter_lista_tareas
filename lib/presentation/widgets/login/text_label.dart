import 'package:flutter/material.dart';
import 'package:lista_tareas/theme/app_theme.dart';

class TextLabel extends StatelessWidget {
  final String label;

  const TextLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: paddingLabel,
      child: Text(
        label,
        style: Theme.of(context).primaryTextTheme.bodyLarge,
      ),
    );
  }
}
