import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class Field extends StatelessWidget {
  final String textValue;
  final String hint;
  final TextInputType? textInputType;
  final IconData? icon;

  const Field({Key? key, required this.textValue, required this.hint, this.icon, this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: myPaddingField,
      child: TextFormField(
        initialValue: textValue,
        keyboardType: textInputType ?? TextInputType.text,
        style: tema.bodyMedium,
        decoration: _myDecoration(
          hint: hint,
          context: context,
          blanco: true,
          icon: icon,
        ),
        validator: (value) {
          return null;
        },
        onSaved: (valor) => () {}, // TODO: implementar
        //onFieldSubmitted: (valor) => FocusScope.of(context).requestFocus(_focusNodeContrasena),
      ),
    );
  }

  InputDecoration _myDecoration({
    required BuildContext context,
    IconData? icon,
    bool? blanco,
    String? hint,
  }) {
    blanco ??= false;
    final tema = Theme.of(context);

    return InputDecoration(
      hintText: hint,
      hintStyle: tema.primaryTextTheme.displayMedium,
      prefixIcon: icon != null
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(icon, color: primary40),
            )
          : null,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: primary60),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: secondary40),
      ),
    );
  }
}
