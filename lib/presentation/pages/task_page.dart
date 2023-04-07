import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_tareas/bloc/home/home_bloc.dart';
import 'package:lista_tareas/bloc/task/task_bloc.dart';
import 'package:lista_tareas/db/task_db.dart';
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
  final String idUser;

  const TaskPage({Key? key, required this.tarea, this.idUser = '0'}) : super(key: key);

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
                  BlocBuilder<TaskBloc, TaskState>(
                    buildWhen: (previous, current) => previous.isLoadingPic != current.isLoadingPic,
                    builder: (context, state) => AvatarTask(img: tarea.img, radius: 70),
                  ),
                  const SizedBox(height: 10.0),
                  tarea.isEditable
                      ? InkWell(
                          onTap: () => _onSelectPicture(context),
                          child: Text(
                            tarea.img == null ? 'Click para abrir galería' : 'Click para cambiar imagen',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12),
                          ),
                        )
                      : const SizedBox.shrink(),
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
                            onSaved: (value) {
                              tarea.titulo = value;
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
                            onSaved: (value) {
                              tarea.descripcion = value;
                            },
                          ),
                          const LabelField(label: 'Fecha'),
                          _rowFecha(tarea, context),
                          _rowFechaCompleted(tarea, context),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  _getButtonActualizar(tarea, context, formKey, scaffoldKey),
                  _getButtonPrincipal(tarea, context, formKey, scaffoldKey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowFecha(Task tarea, BuildContext context) {
    final date = tarea.isNew ? DateTime.now() : tarea.fecha!;
    BlocProvider.of<TaskBloc>(context).add(SetDateEvent(date));

    return Row(
      children: [
        Expanded(
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return DropdownButtonFormField<int>(
                decoration: textFieldDecoration(enabled: tarea.isEditable),
                isExpanded: true,
                items: Task.getDropdownDia(state.date.year, state.date.month),
                value: state.date.day,
                onChanged: tarea.isEditable
                    ? (value) => BlocProvider.of<TaskBloc>(context).add(SetDayDateEvent(value!))
                    : null,
                onSaved: (value) => tarea.dia = value,
              );
            },
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: textFieldDecoration(enabled: tarea.isEditable),
            isExpanded: true,
            items: Task.getDropdownMes(),
            value: date.month,
            onChanged:
                tarea.isEditable ? (value) => BlocProvider.of<TaskBloc>(context).add(SetMonthDateEvent(value!)) : null,
            onSaved: (value) => tarea.mes = value,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: textFieldDecoration(enabled: tarea.isEditable),
            isExpanded: true,
            items: Task.getDropdownAnio(date.year),
            value: date.year,
            onChanged:
                tarea.isEditable ? (value) => BlocProvider.of<TaskBloc>(context).add(SetYearDateEvent(value!)) : null,
            onSaved: (value) => tarea.anio = value,
          ),
        ),
      ],
    );
  }

  Widget _rowFechaCompleted(Task tarea, BuildContext context) {
    return tarea.completada ? Column(
      children: [
        const LabelField(label: 'Fecha de término'),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: tarea.fechaCompleted?.day.toString(),
                enabled: false,
                decoration: textFieldDecoration(
                  enabled: false,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: TextFormField(
                initialValue: Task.mesesMap[tarea.fechaCompleted?.month],
                enabled: false,
                decoration: textFieldDecoration(
                  enabled: false,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: TextFormField(
                initialValue: tarea.fechaCompleted?.year.toString(),
                enabled: false,
                decoration: textFieldDecoration(
                  enabled: false,
                ),
              ),
            ),
          ],
        ),
      ],
    ) : const SizedBox.shrink();
  }

  Widget _getButtonActualizar(
    Task tarea,
    BuildContext context,
    GlobalKey<FormState> formKey,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
  ) {
    return (!tarea.isNew && tarea.isEditable)
        ? ButtonTaskUpdate(
            text: 'Actualizar',
            onPressed: () => _onCreateUpdate(tarea: tarea, formKey: formKey, scaffoldKey: scaffoldKey),
          )
        : const SizedBox.shrink();
  }

  Widget _getButtonPrincipal(
    Task tarea,
    BuildContext context,
    GlobalKey<FormState> formKey,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
  ) {
    return tarea.isNew
        ? ButtonTask(
            text: 'Crear',
            icon: Icons.check,
            onPressed: () => _onCreateUpdate(tarea: tarea, formKey: formKey, scaffoldKey: scaffoldKey),
          )
        : tarea.isEditable
            ? ButtonTask(
                text: 'Completar Tarea',
                icon: Icons.check,
                onPressed: () => _onCreateUpdate(
                  tarea: tarea,
                  formKey: formKey,
                  scaffoldKey: scaffoldKey,
                  markCompleted: true,
                ),
              )
            : const SizedBox.shrink();
  }

  void _onSelectPicture(BuildContext context) async {
    BlocProvider.of<TaskBloc>(context).add(SetIsLoadingPicEvent(true));
    final ImagePicker imagePicker = ImagePicker();
    final XFile? photo = await imagePicker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      tarea.img = await photo.readAsBytes();
    }
    if (context.mounted) {
      BlocProvider.of<TaskBloc>(context).add(SetIsLoadingPicEvent(false));
    }
  }

  void _onCreateUpdate({
    required Task tarea,
    required GlobalKey<FormState> formKey,
    required GlobalKey<ScaffoldMessengerState> scaffoldKey,
    bool markCompleted = false,
  }) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      showInSnackBar(scaffoldKey, errorVerificar);
      return;
    } else {
      formKey.currentState?.save();
      final context = formKey.currentContext!;

      // Crear tarea en la BD
      tarea.fecha = DateTime(tarea.anio!, tarea.mes!, tarea.dia!);
      if (tarea.isNew) {
        tarea.createdBy = int.tryParse(idUser);
        if ((await TaskDb.insert(tarea)) == 0) {
          showInSnackBar(scaffoldKey, 'Error creando tarea');
          return;
        }
      } else {
        if (markCompleted) tarea.setCompleted();

        if ((await TaskDb.update(tarea)) == 0) {
          showInSnackBar(scaffoldKey, 'Error acrualizando tarea');
          return;
        }
      }

      // Emitir estado y Redireccionar a Home
      if (context.mounted) {
        BlocProvider.of<HomeBloc>(context).add(SetHomeEvent(0));
        Navigator.pop(context);
      }
    }
  }
}
