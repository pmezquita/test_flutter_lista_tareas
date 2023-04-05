import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/db/user_db.dart';
import 'package:lista_tareas/presentation/widgets/global/decoration_field.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';
import 'package:lista_tareas/presentation/widgets/login/button_login_singin.dart';
import 'package:lista_tareas/theme/app_theme.dart';

import '../../bloc/user/user_bloc.dart';
import '../../helpers/constants.dart';
import '../../helpers/utils.dart';
import '../../models/user_model.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    UserModel user = UserModel();

    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const Fondo.secondary(),
                  const SizedBox(height: 40.0),
                  Text(
                    'Crear una Cuenta',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 5.0),
                  _formulario(context, user),
                  const Expanded(child: SizedBox.shrink()),
                  ButtonLoginSingin(
                      text: 'Continuar', isPrimary: false, onPressed: () => _submit(formKey, scaffoldKey, user)),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _formulario(BuildContext context, UserModel user) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final TextEditingController textCtrlPass1 = TextEditingController();

    return Padding(
      padding: myPaddingForm,
      child: Column(
        children: [
          const LabelField(label: 'Nombre de Usuario'),
          TextFormField(
            initialValue: '',
            decoration: textFieldDecoration(hint: 'Escoge un nombre de Usuario', prefixIcon: Icons.person_outline),
            validator: (value) {
              if (value == null || value.isEmpty) return errorCampoObligatorio;

              if (value.contains(' ')) return errorNoEspacio;

              return null;
            },
            onSaved: (value) {
              user.username = value;
            },
          ),
          const LabelField(label: 'Escoge una contraseña'),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return TextFormField(
                controller: textCtrlPass1,
                obscureText: state.obscurePassword1,
                decoration: textFieldDecoration(
                  hint: 'Contraseña mayor a 8 dígitos',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: state.obscurePassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  onPressedSuffixIcon: () => userBloc.add(TogglePassword1Event()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return errorCampoObligatorio;

                  if (value.contains(' ')) return errorNoEspacio;

                  if (value.length < 8) return 'Debe ser mayor a 8 dígitos';

                  return null;
                },
              );
            },
          ),
          const LabelField(label: 'Confirma tu contraseña'),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return TextFormField(
                initialValue: '',
                obscureText: state.obscurePassword2,
                decoration: textFieldDecoration(
                  hint: 'Verifica tu contraseña',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: state.obscurePassword2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  onPressedSuffixIcon: () => userBloc.add(TogglePassword2Event()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return errorCampoObligatorio;

                  if (value != textCtrlPass1.text) return 'Las contraseña no coincide';

                  return null;
                },
                onSaved: (value) {
                  user.password = value;
                },
              );
            },
          ),
          LabelLink(
              label1: '¿Ya tienes una contraseña?',
              label2: 'Ingresar con tu cuenta',
              onTap: () => context.goNamed('login')),
        ],
      ),
    );
  }

  void _submit(
    GlobalKey<FormState> formKey,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
    UserModel user,
  ) async {
    final context = formKey.currentContext!;
    if (!(formKey.currentState?.validate() ?? false)) {
      showInSnackBar(scaffoldKey, errorVerificar);
      return;
    } else {
      formKey.currentState?.save();

      // Verificar que no exista el usuario en la BD
      if (await UserDb.existByUsername(user.username)) {
        showInSnackBar(scaffoldKey, 'Usuario ya existe');
        return;
      }
      // TODO: implementar encriptado
      // Crear nuevo usuario
      if ((await UserDb.insert(user)).id == null) {
        showInSnackBar(scaffoldKey, 'Error creando usuario');
        return;
      }

      // Redireccionar a login
      if (context.mounted) {
        context.goNamed('login');
      }
    }
  }
}
