import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  SignInForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailTextEditingController,
            hintText: "Email Address",
          ),
          SizedBox(height: 12),
          CustomTextField(
            controller: _passwordTextEditingController,
            hintText: "Password",
            obsecureText: true,
          ),
        ],
      ),
    );
  }
}

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
        color: Colors.white,
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
          color: Colors.white60,
          fontSize: TEXT_FONT_SIZE,
        ),
      ),
    );
  }
}
