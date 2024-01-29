import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_container.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_description.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/rounded_button.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/size_slider.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProductScreenViewBody extends StatelessWidget {
  const ProductScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        AssetsData.backgroung,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                CustomContainer(
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: KPrimaryColor,
                          // size: 30,
                        )),
                  ),
                ),
                const Spacer(),
                CustomContainer(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: KPrimaryColor,
                      )),
                ),
              ],
            ),
            Center(
              child: Text(
                'OS&Y Gate Valve',
                style: Styles.productTitle.copyWith(
                  fontSize: 32,
                ),
              ),
            ),
            Text(
              'Description',
              style: Styles.productTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16),
            ),
            const CustomDescription(
              textDes:
                  'Flanged End, Nominal Pressure: 300PSI, Approvals: UL, CUL, FM, NSF I ANSI 61 & NSF/ ANSI 372, CCC,  Maximum Working Pressure: 300PSI (Maximum Testing Pressure: 600 PSI) conforms to UL262, ULC/ORD C 262-92, FM 1120/ 1130, Maximum Working Temperature: so•c I 176°F, · Coating Details: Epoxy coated interior and exterior by Electrostatic Spray or Coating upon request, NPT plug on body with 2 operating nuts, Certified lead-free by NSF I ANSI 61 & NSF/ ANSI 372 is available.',
            ),
            Center(
              child: SizedBox(
                width: 154,
                height: 288,
                child: Image.asset(AssetsData.os),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: Styles.productTitle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '15',
                  style: Styles.productTitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: KPrimaryColor,
                      fontSize: 24),
                ),
              ],
            ),
            Text(
              'Size',
              style: Styles.productTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: KPrimaryColor,
                  fontSize: 24),
            ),
            const SizeSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                      child: RoundedButton(
                    text: 'Buy Now',
                    onPressed: () {},
                  )),
                  const Spacer(),
                  Expanded(
                      child: RoundedButton(
                    text: 'Add To Cart',
                    onPressed: () {},
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
