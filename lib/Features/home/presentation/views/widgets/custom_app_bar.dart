import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: [
          const Image(
            image: AssetImage(AssetsData.logo2),
            width: 170,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_pin),
            color: KPrimaryColor,
          )
        ],
      ),
    );
  }
}
