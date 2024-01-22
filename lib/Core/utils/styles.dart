import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const categTitle = TextStyle(
      fontWeight: FontWeight.bold, color: KPrimaryColor, fontSize: 16);
  static const productTitle = TextStyle(
      fontWeight: FontWeight.bold, color: KPrimaryColor, fontSize: 22);
  static const productDes =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14);
  static const signInHead =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);
  static const signInsubtitle = TextStyle(fontSize: 20, color: Colors.white);
}
