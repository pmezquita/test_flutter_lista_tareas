import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/task/avatar_task.dart';
import 'package:lista_tareas/theme/app_theme.dart';

import '../../../models/task_model.dart';

class CardTask extends StatelessWidget {
  final Task tarea;

  const CardTask({Key? key, required this.tarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: myPaddingCard,
      child: Card(
        color: primary90,
        child: ListTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: AvatarTask(imgB64: tarea.imgB64, radius: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(tarea.titulo, style: tema.labelLarge),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tarea.descripcion, style: tema.labelMedium),
                const SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      tarea.completada ? 'Terminado' : 'Pendiente',
                      style: tarea.completada ? tema.labelSmall?.copyWith(color: primary60) : tema.labelSmall,
                      textAlign: TextAlign.start,
                    )),
                    Expanded(
                        child: Text(
                      tarea.formatDate,
                      style: tema.labelSmall,
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                const SizedBox(height: 10.0),
              ],
            ),
            onTap: () => {}),
      ),
    );
  }
}
