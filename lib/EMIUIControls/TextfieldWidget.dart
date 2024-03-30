import 'package:flutter/material.dart';


class TextfieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final int maxLength;

  const TextfieldWidget({super.key, required this.labelText, required this.controller, required this.maxLength});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 3),
        TextField(controller: controller, style: const TextStyle(color: Colors.black), keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder( borderSide: BorderSide(color: Colors.white, width: 5.0),),
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
          ),
        ),


      ],
    );
  }
}