import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  final String text;
  String? image;
  final VoidCallback onPressed;
  final Color? buttonColor;
  DefaultButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.image,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          color: buttonColor ?? Colors.white.withOpacity(0.33),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .050,
        child: MaterialButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image(image: AssetImage(image!))),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
