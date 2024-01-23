import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeiled extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final IconData prefix;
  final String? Function(String?) validate;

  const CustomTextFormFeiled(
      {super.key,
      required this.controller,
      required this.type,
      required this.label,
      required this.prefix,
      required this.validate});

  @override
  State<CustomTextFormFeiled> createState() => _CustomTextFormFeiledState();
}

class _CustomTextFormFeiledState extends State<CustomTextFormFeiled> {
  Function(String)? onSubmit;

  Function(String)? onChange;

  VoidCallback? onTap;

  IconData? suffix;

  VoidCallback? suffixPressed;

  bool readable = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      onTap: onTap,
      validator: widget.validate,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      readOnly: readable,
      decoration: InputDecoration(
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          labelText: widget.label,
          labelStyle: Styles.labeltext,
          prefixIcon: Icon(widget.prefix),
          suffixIcon: Icon(suffix)),
    );
  }
}
