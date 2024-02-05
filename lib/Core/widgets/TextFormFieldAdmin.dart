import'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldAdmin extends StatelessWidget {
  const TextFormFieldAdmin({super.key, required this.controller, required this.type, this.inputFormatters, this.label, this.prefix, required this.validate, this.onSubmit, this.onChange, this.isPassword, this.onTap, this.maxLines});
  final TextEditingController controller;
  final TextInputType type;
  final List<TextInputFormatter>? inputFormatters;
  final String? label;
  final IconData? prefix;
  final String? Function(String?) validate;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final bool? isPassword;
  final VoidCallback? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        SizedBox(height: 7,),

        TextFormField(
          keyboardType:type,
            inputFormatters: inputFormatters,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
            onTap: onTap,
          decoration: InputDecoration(
            labelText: label,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          maxLines: maxLines,

          controller: controller,
          validator: validate),


      ],
    ) ;
  }
}
