import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/bloc/user/user_bloc.dart';
import 'package:lista_tareas/helpers/constants.dart';
import 'package:lista_tareas/models/user_model.dart';
import 'package:lista_tareas/presentation/widgets/global/decoration_field.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';
import 'package:lista_tareas/presentation/widgets/login/button_login_singin.dart';
import 'package:lista_tareas/theme/app_theme.dart';

import '../../db/user_db.dart';
import '../../helpers/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).textTheme;
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
                  const Fondo.primary(),
                  const SizedBox(height: 40.0),
                  Text(
                    'Iniciar Sesión',
                    style: tema.headlineLarge,
                  ),
                  _formulario(context, user),
                  const Expanded(child: SizedBox.shrink()),
                  ButtonLoginSingin(text: 'Continuar', onPressed: () => _submit(formKey, scaffoldKey, user)),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _formulario(BuildContext context, UserModel user) {
    return Padding(
      padding: myPaddingForm,
      child: Column(
        children: [
          const LabelField(label: 'Nombre de Usuario'),
          TextFormField(
            initialValue: '',
            decoration: textFieldDecoration(hint: 'Coloca tu nombre de Usuario', prefixIcon: Icons.person_outline),
            validator: (value) {
              if (value == null || value.isEmpty) return errorCampoObligatorio;

              return null;
            },
            onSaved: (value) {
              user.username = value;
            },
          ),
          const SizedBox(height: 20),
          const LabelField(label: 'Contraseña'),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return TextFormField(
                initialValue: '',
                obscureText: state.obscurePassword1,
                decoration: textFieldDecoration(
                  hint: 'Escribe tu contraseña',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: state.obscurePassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  onPressedSuffixIcon: () => BlocProvider.of<UserBloc>(context).add(TogglePassword1Event()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return errorCampoObligatorio;

                  return null;
                },
                onSaved: (value) {
                  user.password = value;
                  user.password = value;
                },
              );
            },
          ),
          LabelLink(
            label1: '¿No tienes una cuenta?',
            label2: 'Crear una nueva',
            onTap: () => context.goNamed('singin'),
          ),
        ],
      ),
    );
  }

  void _submit(
    GlobalKey<FormState> formKey,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
    UserModel user,
  ) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      showInSnackBar(scaffoldKey, errorVerificar);
      return;
    } else {
      formKey.currentState?.save();
      final context = formKey.currentContext!;

      // Verificar credenciales
      final idUser = await UserDb.isValid(user.username, user.password);
      if (idUser == 0) {
        showInSnackBar(scaffoldKey, 'Usuario y/o contraseña incorrecto');
        return;
      }

      // Redireccionar a Home
      if (context.mounted) {
        BlocProvider.of<UserBloc>(context).add(SetUserEvent(user));
        context.pushNamed('home', params: {'idUser': idUser.toString()});
      }
    }
  }
}
