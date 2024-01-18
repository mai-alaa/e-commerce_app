import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 0.0,
      fillColor: KPrimaryColor,
      constraints: const BoxConstraints.tightFor(
        width: 25,
        height: 25,
      ),
      shape: const CircleBorder(),
      child: Icon(
        MdiIcons.chevronRight,
        color: Colors.white,
      ),
    );
  }
}
