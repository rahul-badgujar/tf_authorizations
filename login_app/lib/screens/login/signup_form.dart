import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);

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
          SizedBox(height: 12),
          CustomTextField(
            controller: _passwordTextEditingController,
            hintText: "Confirm Password",
            obsecureText: true,
          ),
          SizedBox(height: 24),
          CustomElevatedButton(
            lable: "Register",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
