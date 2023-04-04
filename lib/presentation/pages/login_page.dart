import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/bloc/user/user_bloc.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/field.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';
import 'package:lista_tareas/presentation/widgets/login/button_login_singin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).textTheme;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const Fondo.primary(),
              const SizedBox(height: 40.0),
              Text(
                'Iniciar Sesión',
                style: tema.headlineLarge,
              ),
              const LabelField(label: 'Nombre de Usuario'),
              const Field(
                textValue: '',
                hint: 'Coloca tu nombre de Usuario',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              const LabelField(label: 'Contraseña'),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Field(
                    textValue: '',
                    hint: 'Escribe tu contraseña',
                    prefixIcon: Icons.lock_outline,
                    obscureText: state.obscurePassword1,
                    suffixIcon: state.obscurePassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    onPressedSuffixIcon: () => BlocProvider.of<UserBloc>(context).add(TogglePassword1()),
                  );
                },
              ),
              const LabelLink(label1: '¿No tienes una cuenta?', label2: 'Crear una nueva', nameRoute: 'singin'),
              const Expanded(child: SizedBox.shrink()),
              ButtonLoginSingin(text: 'Continuar', onPressed: () => context.pushNamed('home')),
            ],
          ),
        ),
      ],
    ));
  }
}
