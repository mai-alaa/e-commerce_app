import 'package:ecommerce_app/Core/utils/styles.dart';

import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final String presstext;
  final Function function;
  const DefaultTextButton({
    super.key,
    required this.text,
    required this.function,
    required this.presstext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.labeltext,
        ),
        TextButton(
            onPressed: () {
              function();
            },
            child: Text(
              presstext,
              style: Styles.labeltext.copyWith(color: const Color(0xFF70CBFF)),
            ))
      ],
    );
  }
}
