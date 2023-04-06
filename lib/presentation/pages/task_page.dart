import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/presentation/widgets/global/decoration_field.dart';
import 'package:lista_tareas/presentation/widgets/task/avatar_task.dart';
import 'package:lista_tareas/presentation/widgets/task/button_task.dart';
import 'package:lista_tareas/theme/app_theme.dart';

import '../../helpers/constants.dart';
import '../../helpers/utils.dart';
import '../../models/task_model.dart';
import '../widgets/global/appbar.dart';
import '../widgets/global/label_field.dart';
import '../widgets/task/button_task_update.dart';

class TaskPage extends StatelessWidget {
  final Task tarea;

  const TaskPage({Key? key, required this.tarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'New Task',
          showBack: true,
          onPressedBack: () => Navigator.pop(context),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30.0),
                  AvatarTask(imgB64: tarea.imgB64, radius: 70),
                  const SizedBox(height: 10.0),
                  Text(
                    tarea.imgB64 != null ? 'Click para abrir galería' : 'Click para cambiar imagen',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12),
                  ),
                  Padding(
                    padding: myPaddingForm,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const LabelField(label: 'Título'),
                          TextFormField(
                            initialValue: tarea.titulo,
                            enabled: tarea.isEditable,
                            decoration: textFieldDecoration(
                              hint: 'Escribe aquí el título de tu tarea',
                              enabled: tarea.isEditable,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) return errorCampoObligatorio;

                              return null;
                            },
                          ),
                          const LabelField(label: 'Descripción'),
                          TextFormField(
                            initialValue: tarea.descripcion,
                            enabled: tarea.isEditable,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            decoration: textFieldDecoration(
                              hint: 'Describe cómo será tu tarea',
                              enabled: tarea.isEditable,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) return errorCampoObligatorio;

                              return null;
                            },
                          ),
                          const LabelField(label: 'Fecha'),
                          _rowFecha(tarea),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  _getButtonActualizar(tarea, context),
                  _getButtonPrincipal(tarea, context, formKey, scaffoldKey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowFecha(Task tarea) => Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: tarea.dia?.toString(),
              enabled: tarea.isEditable,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: textFieldDecoration(hint: 'Día', enabled: tarea.isEditable),
              validator: (value) {
                if (value == null || value.isEmpty) return errorCampoObligatorio;

                return null;
              },
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: TextFormField(
              initialValue: tarea.mes?.toString(),
              enabled: tarea.isEditable,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: textFieldDecoration(hint: 'Mes', enabled: tarea.isEditable),
              validator: (value) {
                if (value == null || value.isEmpty) return errorCampoObligatorio;

                return null;
              },
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: TextFormField(
              initialValue: tarea.anio?.toString(),
              enabled: tarea.isEditable,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: textFieldDecoration(hint: 'Año', enabled: tarea.isEditable),
              validator: (value) {
                if (value == null || value.isEmpty) return errorCampoObligatorio;

                return null;
              },
            ),
          ),
        ],
      );

  Widget _getButtonActualizar(Task tarea, BuildContext context) => (!tarea.isNew && tarea.isEditable)
      ? ButtonTaskUpdate(text: 'Actualizar', onPressed: () => Navigator.pop(context))
      : const SizedBox.shrink();

  Widget _getButtonPrincipal(
    Task tarea,
    BuildContext context,
    GlobalKey<FormState> formKey,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
  ) =>
      tarea.isNew
          ? ButtonTask(text: 'Crear', icon: Icons.check, onPressed: () => _onCrear(tarea, formKey, scaffoldKey))
          : tarea.isEditable
              ? ButtonTask(
                  text: 'Completar Tarea',
                  icon: Icons.check,
                  onPressed: () => _onCrear(tarea, formKey, scaffoldKey),
                )
              : const SizedBox.shrink();

  void _onCrear(
    Task tarea,
    GlobalKey<FormState> formKey,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
  ) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      showInSnackBar(scaffoldKey, errorVerificar);
      return;
    } else {
      formKey.currentState?.save();
      final context = formKey.currentContext!;

      // Crear tarea en la BD

      // Emitir estado

      // Redireccionar a Home
      if (context.mounted) {
        //BlocProvider.of<UserBloc>(context).add(SetUserEvent(user));
        context.pushNamed('home');
      }
    }
  }
}
