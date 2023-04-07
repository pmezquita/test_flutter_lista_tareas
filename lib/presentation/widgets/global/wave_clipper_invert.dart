import 'package:flutter/material.dart';

class WaveClipperInvert extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - (size.height / 4));

    var firstStart = Offset(size.width / 4, size.height - (size.height / 2));
    // var firstStart = Offset(size.width / 4, size.height);
    var firstEnd = Offset(size.width / 2, size.height - (size.height / 4));
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    // var secondStart = Offset(size.width - (size.width / 4), size.height - (size.height / 2));
    var secondStart = Offset(size.width - (size.width / 4), size.height);
    var secondEnd = Offset(size.width, size.height - (size.height / 4));
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
