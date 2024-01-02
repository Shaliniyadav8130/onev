import 'package:flutter/material.dart';
import 'package:version1/utils/dimensions.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color borderColor; // New property for border color
  final double borderRadius; // New property for border radius

  TextFieldWidget({
    required this.controller,
    this.hintText = '',
    required this.borderColor,
    this.borderRadius = 4.0, // Default border radius is set to 8.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height48, // Adjust the height as needed
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
