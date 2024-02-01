import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFeiled extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final IconData prefix;
  final String? Function(String?) validate;
  final Function(String)? onSubmit;

  final Function(String)? onChange;
  final bool isPassword;

  final VoidCallback? onTap;

  CustomTextFormFeiled(
      {super.key,
      required this.controller,
      required this.type,
      required this.label,
      required this.prefix,
      required this.validate,
      this.onSubmit,
      this.onChange,
      this.onTap,
      this.suffix,
      this.suffixPressed,
      this.isPassword = false});

  final bool readable = false;

  final bool isClickable = true;

  IconData? suffix;

  VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      onTap: onTap,
      validator: validate,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      readOnly: readable,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        labelText: label,
        labelStyle: Styles.labeltext,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );
  }
}
