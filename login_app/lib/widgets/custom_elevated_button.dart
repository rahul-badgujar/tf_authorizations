import 'package:flutter/material.dart';

import '../resources/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.lable,
  }) : super(key: key);

  final void Function() onPressed;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        lable,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor:
            MaterialStateProperty.all<Color>(ColorPalette.primaryColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(2),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            MediaQuery.of(context).size.width * 0.5,
            50,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
