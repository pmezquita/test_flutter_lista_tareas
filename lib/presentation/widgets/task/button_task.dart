import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/global/button_principal.dart';

import '../../../theme/app_theme.dart';
class ButtonTask extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback? onPressed;

  const ButtonTask({
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
      height: 64.0,
      margin: marginBtnFormPrincipal,
      child: ButtonPrincipal(
        text: text,
        isPrimary: isPrimary,
        icon: icon,
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
