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
                  SizedBox(height: 32),
                  Expanded(
                    child: _buildAppLogo(context),
                    flex: 1,
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        _buildTabTitles(context),
                        SizedBox(height: 16),
                        Expanded(
                          child: _buildTabItems(context),
                        ),
                      ],
                    ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('assets/images/insta_logo.png'),
          ),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Instagram",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Your place for memes, news",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
