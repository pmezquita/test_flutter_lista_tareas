import 'package:flutter/material.dart';

class Fondo extends StatelessWidget {
  final Color colorIni, colorFin;

  const Fondo({Key? key, required this.colorIni, required this.colorFin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[colorIni, colorFin],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100.0), color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
      ],
    );
  }
}
