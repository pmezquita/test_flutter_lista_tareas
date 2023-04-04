import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/bloc/user/user_bloc.dart';
import 'package:lista_tareas/helpers/constants.dart';
import 'package:lista_tareas/models/user_model.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/field.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';
import 'package:lista_tareas/presentation/widgets/login/button_login_singin.dart';

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
                  const LabelField(label: 'Nombre de Usuario'),
                  Field(
                    textValue: '',
                    hint: 'Coloca tu nombre de Usuario',
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return errorCampoObligatorio;
                      }
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
                      return Field(
                        textValue: '',
                        hint: 'Escribe tu contraseña',
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: state.obscurePassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        obscureText: state.obscurePassword1,
                        onPressedSuffixIcon: () => BlocProvider.of<UserBloc>(context).add(TogglePassword1Event()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return errorCampoObligatorio;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user.password = value;
                        },
                      );
                    },
                  ),
                  const LabelLink(label1: '¿No tienes una cuenta?', label2: 'Crear una nueva', nameRoute: 'singin'),
                  const Expanded(child: SizedBox.shrink()),
                  ButtonLoginSingin(
                      text: 'Continuar',
                      onPressed: () => _submit(formKey, scaffoldKey, user)),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _submit(
    GlobalKey<FormState> formKey,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
    UserModel user,
  ) {
    if (!(formKey.currentState?.validate() ?? false)) {
      showInSnackBar(scaffoldKey, errorVerificar);
      return;
    } else {
      formKey.currentState?.save();
      final context = formKey.currentContext!;
      BlocProvider.of<UserBloc>(context).add(SetUserEvent(user));
      context.pushNamed('home');
    }
  }
}
