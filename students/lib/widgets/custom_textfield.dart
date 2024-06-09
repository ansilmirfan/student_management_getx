// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomeTextfield extends StatelessWidget {
  String labelText;
  String? Function(String?) validator;
  TextEditingController controller;
  TextInputType? keyboardType;

  CustomeTextfield(
      {super.key,
      required this.labelText,
      required this.controller,
      this.keyboardType = TextInputType.name,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        cursorColor: Colors.white,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusColor: Colors.white,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          contentPadding: const EdgeInsets.only(left: 10),
        ),
      ),
    );
  }
}
