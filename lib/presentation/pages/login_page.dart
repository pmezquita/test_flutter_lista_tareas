import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/field.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';
import 'package:lista_tareas/presentation/widgets/login/button_login_singin.dart';
import 'package:lista_tareas/theme/app_theme.dart';

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
              const Fondo(colorIni: primary40, colorFin: primary90),
              const SizedBox(height: 40.0),
              Text(
                'Iniciar Sesión',
                style: tema.headlineLarge,
              ),
              const LabelField(label: 'Nombre de Usuario'),
              const Field(
                textValue: '',
                hint: 'Coloca tu nombre de Usuario',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              const LabelField(label: 'Contraseña'),
              const Field(
                textValue: '',
                hint: 'Escribe tu contraseña',
                icon: Icons.lock_outline,
                obscureText: true,
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
