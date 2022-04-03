import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';
import 'package:login_app/screens/login/signin_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SafeArea(
          child: SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  _buildAppLogo(context),
                  SizedBox(height: 8),
                  _buildTabTitles(context),
                  SizedBox(height: 16),
                  Expanded(
                    child: _buildTabItems(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppLogo(BuildContext context) {
    return Text("App Logo here");
  }

  Widget _buildTabTitles(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        Tab(
          text: "      Sign In      ",
        ),
        Tab(
          text: "      Sign Up      ",
        ),
      ],
    );
  }

  Widget _buildTabItems(BuildContext context) {
    return TabBarView(children: [
      _buildSignInTabContent(context),
      _buildSignUpTabContext(context),
    ]);
  }

  Widget _buildSignInTabContent(BuildContext context) {
    return SignInForm();
  }

  Widget _buildSignUpTabContext(BuildContext context) {
    return Text("Sign in content here soon");
  }
}
