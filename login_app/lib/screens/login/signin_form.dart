import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';

import '../../widgets/custom_text_field.dart';

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
          SizedBox(height: 12),
          ElevatedButton(
            child: Text(
              "Login",
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
