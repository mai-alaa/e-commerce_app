import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Container(
                  width: 30,
                  height: 33,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Image.asset(
                    AssetsData.tornatech3,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            const Expanded(
                flex: 1, child: Text('Tornatech', style: Styles.categTitle)),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: CustomButton(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
