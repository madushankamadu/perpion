import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData? prefixIcon;
  final bool isPasswordField;
  final TextEditingController? controller;
  final BorderSide borderSide;
  final double radius;
  final Color? bgColor;

  const CustomTextField({
    Key? key,
    required this.labelText,       // Use required here
    this.prefixIcon = null,      // Use required here
    this.isPasswordField = false,  // Optional with default value
    this.controller,
    required this.radius,
    required this.borderSide,
    required this.bgColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: bgColor, // Set the background color here
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius), // Add border radius here
          borderSide: borderSide,
        ),
        // Conditionally show the prefixIcon only if it's not null
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: isPasswordField ? Icon(Icons.visibility) : null,
      ),
    );
    ;
  }
}
