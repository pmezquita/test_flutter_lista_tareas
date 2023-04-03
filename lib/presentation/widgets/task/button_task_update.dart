import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/global/button_principal.dart';
import 'package:lista_tareas/presentation/widgets/global/button_update.dart';

import '../../../theme/app_theme.dart';

class ButtonTaskUpdate extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback? onPressed;

  const ButtonTaskUpdate({
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
      height: 40.0,
      margin: marginBtnFormSecundario,
      child: ButtonUpdate(
        text: text,
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
