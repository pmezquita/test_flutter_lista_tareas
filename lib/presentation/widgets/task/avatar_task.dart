import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class AvatarTask extends StatelessWidget {
  final String imgB64;
  final double radius;

  const AvatarTask({Key? key, required this.imgB64, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imgB64.isNotEmpty)
        ? CircleAvatar(
            radius: radius,
            backgroundColor: primary60,
            backgroundImage: MemoryImage(base64Decode(imgB64)),
          )
        : CircleAvatar(
            backgroundColor: primary60,
            radius: radius,
            child: CircleAvatar(
              radius: radius - 2,
              backgroundColor: primary90,
              child: Icon(
                Icons.photo_library_outlined,
                size: radius - 10,
                color: primary20,
              ),
            ),
          );
  }
}
