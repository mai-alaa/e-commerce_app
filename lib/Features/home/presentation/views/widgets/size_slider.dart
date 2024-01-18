import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

class SizeSlider extends StatefulWidget {
  const SizeSlider({super.key});

  @override
  State<SizeSlider> createState() => _SizeSliderState();
}

class _SizeSliderState extends State<SizeSlider> {
  @override
  Widget build(BuildContext context) {
    double value = 12;
    return SfSlider(
        value: value,
        min: 2,
        max: 12,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        minorTicksPerInterval: 1,
        onChanged: (dynamic value) {
          setState(() {});
          (() {
            value = value;
          });
        });
  }
}
