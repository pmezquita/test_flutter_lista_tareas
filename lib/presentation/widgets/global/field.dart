import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/app_theme.dart';

class Field extends StatelessWidget {
  final String? textValue;
  final String hint;
  final TextInputType keyboardType;
  final IconData? icon;
  final bool obscureText;
  final bool digitsOnly;
  final bool enabled;

  const Field({
    Key? key,
    this.textValue,
    required this.hint,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.digitsOnly = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).textTheme;
    return Padding(
      padding: myPaddingField,
      child: TextFormField(
        enabled: enabled,
        obscureText: obscureText,
        initialValue: textValue,
        keyboardType: digitsOnly ? TextInputType.number : keyboardType,
        maxLines: (keyboardType == TextInputType.multiline) ? 6 : 1,
        inputFormatters: digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
        style: tema.bodyMedium,
        decoration: InputDecoration(
          filled: !enabled,
          fillColor: enabled ? null : primary90,
          hintText: hint,
          prefixIcon:
              icon != null ? Padding(padding: const EdgeInsets.all(12.0), child: Icon(icon, color: primary40)) : null,
        ),
        validator: (value) {
          return null;
        },
        onSaved: (valor) => () {},
        //onFieldSubmitted: (valor) => FocusScope.of(context).requestFocus(_focusNodeContrasena),
      ),
    );
  }
}
