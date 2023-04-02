import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class LabelLink extends StatelessWidget {
  final String label1;
  final String label2;
  const LabelLink({Key? key, required this.label1, required this.label2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).primaryTextTheme;
    return Container(
      padding: paddingLabel,
      child: Column(
        children: [
          Text(
            label1,
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
                  label2,
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
