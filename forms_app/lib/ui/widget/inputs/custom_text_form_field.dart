import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? errorMessage;
  final String? hintText;
  final IconData? icon;
  final bool isEnable;
  final String? label;
  final bool isObscure;
  final Function(String)? onChange;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    this.errorMessage,
    this.hintText,
    this.icon,
    this.isEnable = true,
    this.label,
    this.isObscure = false,
    this.onChange,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      enabled: isEnable,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: errorMessage != null ? colors.error : colors.primary,
              )
            : null,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        errorText: errorMessage,
      ),
    );
  }
}
