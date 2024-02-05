import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_app/Core/widgets/RoundedDropDownInput.dart';
import 'package:ecommerce_app/Core/widgets/TextFormFieldAdmin.dart';
import 'package:ecommerce_app/Core/widgets/custom_textFormFeiled.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/addproductform.dart';
import 'package:ecommerce_app/constants.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../Core/utils/styles.dart';
import '../../../../Core/widgets/default_textButton.dart';
import '../../../auth/presentations/views/widget/background_auth.dart';

class UploadProductForm extends StatefulWidget {

  static const routeName ="/UploadProductForm";

  const UploadProductForm({Key? key}):super(key: key);

  @override
  State<UploadProductForm> createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {


  Widget build(BuildContext context) {

    var inputDecoration = const InputDecoration(
      filled: true,
      fillColor: ScaffoldColor,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: KPrimaryColor,
          width: 1.0,

        ),
      ),
    );

    return  Scaffold(
      backgroundColor: KPrimaryColor ,
        body: Stack(

          children: [
            const BackgroundAuth(),
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    width: 600,

                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: AddProductForm(),
                      ),
                    ),
                  ),
                ),

            ),
          ],
        ) ,


    );
  }
}
