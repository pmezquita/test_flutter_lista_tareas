import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/login/button_principal.dart';
import 'package:lista_tareas/presentation/widgets/login/crear_cuenta_label.dart';
import 'package:lista_tareas/presentation/widgets/login/field.dart';
import 'package:lista_tareas/presentation/widgets/login/fondo.dart';
import 'package:lista_tareas/presentation/widgets/login/text_label.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).primaryTextTheme;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const Fondo(),
              const SizedBox(height: 40.0),
              Text(
                'Iniciar Sesión',
                style: tema.headlineLarge,
              ),
              const TextLabel(label: 'Nombre de Usuario'),
              const Field(
                textValue: '',
                hint: 'Coloca tu nombre de Usuario',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              const TextLabel(label: 'Contraseña'),
              const Field(
                textValue: '',
                hint: 'Escribe tu contraseña',
                icon: Icons.lock_outline,
              ),
              const CrearCuentaLabel(),
              const Expanded(child: SizedBox.shrink()),
              const ButtonPrincipal(text: 'Continuar'),
            ],
          ),
        ),
      ],
    ));
  }
}
