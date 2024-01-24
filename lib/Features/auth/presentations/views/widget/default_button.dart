import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .050,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromARGB(33, 255, 255, 255)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)))),
        child: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
