import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  const CustomTextField({
    super.key,
    this.hint,
    this.isPassword = false,
    required this.controller,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: TextFormField(
        validator: validate,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,

          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
