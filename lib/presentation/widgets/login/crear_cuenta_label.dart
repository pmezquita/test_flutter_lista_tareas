import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class CrearCuentaLabel extends StatelessWidget {
  const CrearCuentaLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).primaryTextTheme;
    return Container(
      padding: paddingLabel,
      child: Column(
        children: [
          Text(
            '¿No tienes una cuenta?',
            style: tema.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Puedes ',
                  style: tema.headlineMedium,
                ),
                Text(
                  'Crear una nueva',
                  style: tema.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
