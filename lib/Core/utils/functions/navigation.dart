import 'package:ecommerce_app/constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

void navigateTo(context, widget) {
  Future.delayed(const Duration(seconds: 1), () {
    Get.to(widget, transition: Transition.fade, duration: KTransitionDurations);
  });
}
