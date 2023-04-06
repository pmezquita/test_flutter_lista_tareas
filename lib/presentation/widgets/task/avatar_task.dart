import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class AvatarTask extends StatelessWidget {
  final Uint8List? img;
  final double radius;
  final bool showAlways;

  const AvatarTask({Key? key, required this.img, required this.radius, this.showAlways = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (img != null)
        ? CircleAvatar(
            radius: radius,
            backgroundColor: primary60,
            backgroundImage: MemoryImage(img!),
          )
        : showAlways
            ? CircleAvatar(
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
              )
            : const SizedBox(height: 60.0);
  }
}
