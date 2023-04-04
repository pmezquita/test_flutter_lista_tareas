import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_tareas/presentation/widgets/global/label_link.dart';
import 'package:lista_tareas/presentation/widgets/global/field.dart';
import 'package:lista_tareas/presentation/widgets/global/fondo.dart';
import 'package:lista_tareas/presentation/widgets/global/label_field.dart';
import 'package:lista_tareas/presentation/widgets/login/button_login_singin.dart';
import 'package:lista_tareas/theme/app_theme.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({Key? key}) : super(key: key);

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
              const Fondo(colorIni: secondary20, colorFin: secondary90),
              const SizedBox(height: 40.0),
              Text(
                'Crear una Cuenta',
                style: tema.headlineLarge,
              ),
              const LabelField(label: 'Nombre de Usuario'),
              const Field(
                textValue: '',
                hint: 'Escoge un nombre de Usuario',
                icon: Icons.person_outline,
              ),
              const LabelField(label: 'Escoge una contraseña'),
              const Field(
                textValue: '',
                hint: 'Contraseña mayor a 8 dígitos',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const LabelField(label: 'Confirma tu contraseña'),
              const Field(
                textValue: '',
                hint: 'Verifica tu contraseña',
                icon: Icons.lock_outline,
                obscureText: true,
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
