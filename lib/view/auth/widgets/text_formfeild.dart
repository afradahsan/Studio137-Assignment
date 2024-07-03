import 'package:flutter/material.dart';

class TFormFeild extends StatelessWidget {
  const TFormFeild({super.key, this.label, required this.controller});

  final String? label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
      controller: controller,
    );
  }
}
