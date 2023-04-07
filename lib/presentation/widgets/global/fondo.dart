import 'package:flutter/material.dart';
import 'package:lista_tareas/presentation/widgets/global/wave_clipper.dart';
import 'package:lista_tareas/presentation/widgets/global/wave_clipper_invert.dart';
import 'package:lista_tareas/theme/app_theme.dart';

class Fondo extends StatelessWidget {
  final Color color1, color2, color3;
  final double maxHeight;

  const Fondo._base(
      {Key? key, required this.color1, required this.color2, required this.color3, required this.maxHeight})
      : super(key: key);

  const Fondo.primary({Key? key})
      : this._base(color1: primary40, color2: primary60, color3: primary90, maxHeight: 250, key: key);

  const Fondo.secondary({Key? key})
      : this._base(color1: secondary40, color2: secondary60, color3: secondary90, maxHeight: 250, key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //stack overlaps widgets
        ClipPath(
          //upper clippath with less height
          clipper: WaveClipperInvert(),
          child: Container(
            color: color3,
            height: maxHeight,
          ),
        ),

        ClipPath(
          //upper clippath with less height
          clipper: WaveClipper(),
          child: Container(
            color: color2,
            height: maxHeight - maxHeight/3.5,
          ),
        ),
        ClipPath(
          //upper clippath with less height
          clipper: WaveClipperInvert(),
          child: Container(
            color: color1,
            height: maxHeight - maxHeight/2,
          ),
        ),

        // Opacity(
        //   //semi red clippath with more height and with 0.5 opacity
        //   opacity: 0.5,
        //   child: ClipPath(
        //     clipper: WaveClipper(), //set our custom wave clipper
        //     child: Container(
        //       color: color2,
        //       height: 200,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
