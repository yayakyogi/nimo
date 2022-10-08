import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isFormPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String label;
  final bool isFormPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: medium,
            color: whiteColor,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: isFormPassword,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            filled: true,
            fillColor: whiteColor,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14,
              color: primaryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: secondaryColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: secondaryColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
