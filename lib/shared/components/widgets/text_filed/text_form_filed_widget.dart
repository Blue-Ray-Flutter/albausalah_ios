import 'package:flutter/material.dart';

import '../../constants/style/color.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final String? hint;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool isPassword;
  final bool enabled;
  final bool filled;
  final bool readOnly;
  final bool havePrefix;
  final double radius;
  final int? maxLength;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final bool? isEmail;
  final List<IconData>? prefixIcons;
  final FocusNode? focusNode;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final Widget? suffix;
  final BorderRadius? borderRadius;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;
  final Color? borderColors;
  final Color? fillColor;
  final Color focusBorderColor;
  final Color textColor;

  const DefaultFormField({
    Key? key,
    this.havePrefix = true,
    this.controller,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.hint,
    this.onSubmit,
    this.onChange,
    this.onTap,
    required this.isPassword,
    required this.enabled,
    required this.readOnly,
    required this.radius,
    this.maxLength,
    this.labelStyle,
    this.hintStyle,
    this.prefixText,
    this.prefixStyle,
    this.isEmail,
    this.prefixIcons,
    this.focusNode,
    this.suffixText,
    this.suffixStyle,
    this.suffix,
    this.borderRadius,
    this.maxLines,
    required this.autofocus,
    this.borderColors,
    required this.focusBorderColor,
    required this.textColor,
    required this.filled,
    this.fillColor,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.globalIconColor,
      keyboardType: isEmail == null
          ? TextInputType.text
          : isEmail!
              ? TextInputType.emailAddress
              : TextInputType.phone,
      obscureText: isPassword,
      validator: validator,
      onChanged: onChange,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      enabled: enabled,
      readOnly: readOnly,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      autofocus: autofocus,
      focusNode: focusNode,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        counter: const Offstage(),
        errorStyle: const TextStyle(
          color: AppColor.globalErrorColor,
        ),
        filled: filled,
        fillColor: fillColor ?? AppColor.globalDefaultColor,
        focusColor: AppColor.globalDefaultColor,
        labelStyle: labelStyle,
        labelText: label,
        hintText: hint,
        hintStyle: hintStyle ??
            const TextStyle(
              color: AppColor.globalTextColor,
              fontSize: 14,
            ),
        suffixText: suffixText,
        suffix: suffix,
        suffixStyle: suffixStyle,
        prefixStyle: prefixStyle,
        prefixText: prefixText,
        alignLabelWithHint: true,
        prefixIcon: havePrefix
            ? Icon(
                prefixIcon,
                color: AppColor.globalIconColor,
              )
            : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: borderColors != null
              ? BorderSide(
                  color: borderColors!,
                  width: 0.4,
                )
              : const BorderSide(
                  color: AppColor.globalBorderColor,
                  width: 0.4,
                ),
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: borderColors != null
              ? BorderSide(
                  color: borderColors!,
                  width: 0.4,
                )
              : const BorderSide(
                  color: AppColor.globalBorderColor,
                  width: 0.4,
                ),
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusBorderColor,
            width: 0.4,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.globalErrorColor,
            width: 0.4,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
