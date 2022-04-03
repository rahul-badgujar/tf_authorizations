import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';
import 'package:tf_responsive/tf_responsive.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obsecureText = false,
  }) : super(key: key);

  static final double textFontSize = tfText(2.1);
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
        fontSize: textFontSize,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: tfWidth(5),
          vertical: tfHeight(2),
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
          fontSize: textFontSize,
        ),
      ),
    );
  }
}
