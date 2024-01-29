// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

const KPrimaryColor = Color(0xFF013D6C);
const KSecColor = Color.fromARGB(143, 136, 136, 100);

const KTransitionDurations = Duration(seconds: 1);
const spacehight = SizedBox(height: 20);
const space50 = SizedBox(height: 50);
const space30 = SizedBox(height: 30);
void navigateTo(context, widget) {
  Future.delayed(const Duration(seconds: 1), () {
    Get.to(widget, transition: Transition.fade, duration: KTransitionDurations);
  });
}
