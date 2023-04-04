import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/app_theme.dart';

class Field extends StatelessWidget {
  final String? textValue;
  final String hint;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressedSuffixIcon;
  final bool obscureText;
  final bool digitsOnly;
  final bool enabled;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const Field({
    Key? key,
    this.textValue,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedSuffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.digitsOnly = false,
    this.enabled = true,
    this.validator,
    this.onSaved,
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
          prefixIcon: prefixIcon != null
              ? Padding(padding: const EdgeInsets.all(14.5), child: Icon(prefixIcon, color: primary40))
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: primary40),
                  onPressed: onPressedSuffixIcon,
                )
              : null,
        ),
        validator: (value) {
          if (validator == null) return null;

          return validator!(value);
        },
        onSaved: (valor) {
          if (onSaved != null) onSaved!(valor);
        },
      ),
    );
  }
}
