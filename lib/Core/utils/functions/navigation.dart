import 'package:ecommerce_app/constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

void navigateTo(context, widget, Duration duration) {
  Future.delayed(duration, () {
    Get.to(widget, transition: Transition.fade, duration: KTransitionDurations);
  });
}
