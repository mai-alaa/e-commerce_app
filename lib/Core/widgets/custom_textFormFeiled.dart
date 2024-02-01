import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeiled extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final IconData prefix;
  final String? Function(String?) validate;
  final Function(String)? onSubmit;

  final Function(String)? onChange;

  final VoidCallback? onTap;

  final IconData? suffix;

  final VoidCallback? suffixPressed;

  final bool readable = false;

  const CustomTextFormFeiled({
    super.key,
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
  });

  @override
  State<CustomTextFormFeiled> createState() => _CustomTextFormFeiledState();
}

class _CustomTextFormFeiledState extends State<CustomTextFormFeiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      onTap: widget.onTap,
      validator: widget.validate,
      onChanged: widget.onChange,
      onFieldSubmitted: widget.onSubmit,
      readOnly: widget.readable,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          labelText: widget.label,
          labelStyle: Styles.labeltext,
          prefixIcon: Icon(widget.prefix),
          suffixIcon: Icon(widget.suffix)),
    );
  }
}
