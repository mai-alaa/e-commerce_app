import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.26,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .13,
                decoration: ShapeDecoration(
                  color: KPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text('OS&Y Valve', style: Styles.productTitle),
                  Spacer(),
                  Text(
                    '15',
                    style: Styles.productTitle,
                  ),
                ],
              ),
              const Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Flanged End, Nominal Pressure: 300PSI, Approvals: UL, CUL, FM, NSF I ANSI 61 & NSF/ ANSI 372, CCC,  Maximum Working Pressure: 300PSI (Maximum Testing Pressure: 600 PSI) conforms to UL262, ULC/ORD C 262-92, FM 1120/ 1130, Maximum Working Temperature: so•c I 176°F, · Coating Details: Epoxy coated interior and exterior by Electrostatic Spray or Coating upon request, NPT plug on body with 2 operating nuts, Certified lead-free by NSF I ANSI 61 & NSF/ ANSI 372 is available.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.productDes,
                      ),
                    ),
                    Spacer(),
                    Text('APC CHVPB  ', style: Styles.productDes),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
