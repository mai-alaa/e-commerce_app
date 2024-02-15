import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

class CustomConditionalBuilder extends StatefulWidget {
  final bool condition;
  final Widget Function(BuildContext) builder;

  const CustomConditionalBuilder({
    super.key,
    required this.condition,
    required this.builder,
  });

  @override
  State<CustomConditionalBuilder> createState() =>
      _CustomConditionalBuilderState();
}

class _CustomConditionalBuilderState extends State<CustomConditionalBuilder> {
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: widget.condition,
        builder: widget.builder,
        fallback: (BuildContext context) =>
            const Center(child: CircularProgressIndicator()));
  }
}
