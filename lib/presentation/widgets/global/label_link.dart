import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_theme.dart';

class LabelLink extends StatelessWidget {
  final String label1;
  final String label2;
  final String nameRoute;

  const LabelLink({
    Key? key,
    required this.label1,
    required this.label2,
    required this.nameRoute,
  }) : super(key: key);

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
                InkWell(
                  child: Text(
                    label2,
                    style: tema.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  onTap: () => context.goNamed(nameRoute),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
