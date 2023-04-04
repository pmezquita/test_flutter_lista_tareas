import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/field.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';
import 'package:lista_tareas/presentation/widgets/login/button_login_singin.dart';

import '../../bloc/user/user_bloc.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).textTheme;
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const Fondo.secondary(),
              const SizedBox(height: 40.0),
              Text(
                'Crear una Cuenta',
                style: tema.headlineLarge,
              ),
              const SizedBox(height: 5.0),
              const LabelField(label: 'Nombre de Usuario'),
              const Field(
                textValue: '',
                hint: 'Escoge un nombre de Usuario',
                prefixIcon: Icons.person_outline,
              ),
              const LabelField(label: 'Escoge una contraseña'),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Field(
                    textValue: '',
                    hint: 'Contraseña mayor a 8 dígitos',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: state.obscurePassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    obscureText: state.obscurePassword1,
                    onPressedSuffixIcon: () => userBloc.add(TogglePassword1Event()),
                  );
                },
              ),
              const LabelField(label: 'Confirma tu contraseña'),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Field(
                    textValue: '',
                    hint: 'Verifica tu contraseña',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: state.obscurePassword2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    obscureText: state.obscurePassword2,
                    onPressedSuffixIcon: () => userBloc.add(TogglePassword2Event()),
                  );
                },
              ),
              const LabelLink(
                  label1: '¿Ya tienes una contraseña?', label2: 'Ingresar con tu cuenta', nameRoute: 'login'),
              const Expanded(child: SizedBox.shrink()),
              ButtonLoginSingin(text: 'Continuar', isPrimary: false, onPressed: () => context.goNamed('login')),
            ],
          ),
        ),
      ],
    ));
  }
}
