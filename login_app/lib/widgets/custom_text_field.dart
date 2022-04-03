import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obsecureText = false,
  }) : super(key: key);

  static const double TEXT_FONT_SIZE = 15.0;
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      style: TextStyle(
        color: ColorPalette.textColorBright,
        fontSize: TEXT_FONT_SIZE,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.black26,
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorPalette.textColorBrightDimmed,
          fontSize: TEXT_FONT_SIZE,
        ),
      ),
    );
  }
}
