import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/global/button_principal.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/field.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';

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
              ),
              const LabelLink(label1: '¿No tienes una cuenta?', label2: 'Crear una nueva'),
              const Expanded(child: SizedBox.shrink()),
              const ButtonPrincipal(text: 'Continuar'),
            ],
          ),
        ),
      ],
    ));
  }
}
