import 'package:flutter/material.dart';

import '../../constants.dart';


class RoundedDropdownInput extends StatefulWidget {
  @override
  _RoundedDropdownInputState createState() => _RoundedDropdownInputState();
}

class _RoundedDropdownInputState extends State<RoundedDropdownInput> {
  String selectedOption = 'Option 1';
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
    padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.black54),
      ),
      child: DropdownButton<String>(
        value: selectedOption,
        icon: Padding(
          padding: const EdgeInsets.only(left:70.0),
          child: Icon(Icons.arrow_drop_down,color: KPrimaryColor,),
        ),
        iconSize: 24,
       elevation: 16,
        style: TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (value) {
          setState(() {
            selectedOption = value!;
          });
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}