import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  IconData? icon;
  final VoidCallback onPressed;
  DefaultButton(
      {super.key, required this.text, required this.onPressed, required icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .050,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromARGB(33, 255, 255, 255)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
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
      ),
    );
  }
}
