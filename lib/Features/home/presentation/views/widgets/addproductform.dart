import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/RoundedDropDownInput.dart';
import '../../../../../Core/widgets/TextFormFieldAdmin.dart';
import '../../../../../constants.dart';
class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {

  final _formKey = GlobalKey<FormState>();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  late final TextEditingController _titleController,
      _priceController,
      _discController;

  @override
  void initState(){
    _titleController = TextEditingController();
    _priceController = TextEditingController();
    _discController = TextEditingController();

    super.initState();
  }

  @override
  void dispose(){
    if (mounted){
      _titleController.dispose();
      _priceController.dispose();
      _discController.dispose();

    }

    super.dispose();

  }

  void _UploadForm()async{
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage==null){
      Fluttertoast.showToast(msg: 'Choose an Image',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,);

      return;

    }

  }
  void UploadImage(){

  }
  void ClearImage(){

  }
  void _clearForm(){
    _priceController.clear();
    _titleController.clear();
    _discController.clear();
    setState(() {
      _pickedImage =null;
      webImage = Uint8List(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Title',style:Styles.FormLabel,),
          TextFormFieldAdmin(controller: _titleController,
            type: TextInputType.text,

            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Title';
              }
              return null;
            },),
          const SizedBox(height: 15,),

          const Text('Project Description',style:Styles.FormLabel,),
          TextFormFieldAdmin(controller: _discController, type: TextInputType.text, validate: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Title';
            }
            return null;
          }, maxLines: 3,),


          const SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Price',style:Styles.FormLabel,),
                  const SizedBox(height:3,),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormFieldAdmin(
                          controller: _priceController,

                          type: TextInputType.number, validate:(value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Price';
                          }
                          return null;
                        },
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'),)],
                        ),
                      ),
                      const Text('  \$',style: Styles.categTitle,),
                    ],
                  ),
                ],
              ),


              const SizedBox(width: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Category',style:Styles.FormLabel,),
                  const SizedBox(height: 12,),
                  RoundedDropdownInput(),
                ],)

            ],
          ),
          const SizedBox(height: 15,),
          const Text('Item Image',style:Styles.FormLabel,),
          const SizedBox(height:7,),
          Center(
            child: Expanded(
              child: Container(
                height: 140,
                //  width: 190,
                decoration: BoxDecoration(
                  color: ScaffoldColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _pickedImage == null ?   DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Center(child: Image.asset('assets/images/upload.png',width: 100,)),
                  ),
                ): ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.file(_pickedImage!,fit: BoxFit.fill, ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: UploadImage, child: const Text('Upload',style: TextStyle(color: Colors.blue),)),
              TextButton(onPressed: ClearImage, child: const Text('Clear',style: TextStyle(color: Colors.red))),

            ],
          ),




        ],
      ),
    );
  }
}
