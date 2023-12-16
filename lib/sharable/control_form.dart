import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.validationText,
    required this.hintText, required TextInputType keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String validationText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return validationText;
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
