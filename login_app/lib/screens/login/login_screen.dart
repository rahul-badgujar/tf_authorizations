import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';
import 'package:login_app/screens/login/signin_form.dart';
import 'package:login_app/screens/login/signup_form.dart';
import 'package:login_app/widgets/app_logo.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  Expanded(
                    child: AppLogo(),
                    flex: 2,
                  ),
                  SizedBox(height: 32),
                  Expanded(
                    flex: 10,
                    child: _buildAuthTabsContent(context),
                  ),
                  Expanded(
                    child: _buildSocialLoginPanel(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthTabsContent(BuildContext context) {
    return Column(
      children: [
        _buildTabTitles(context),
        SizedBox(height: 16),
        Expanded(
          child: _buildTabItems(context),
        ),
      ],
    );
  }

  Widget _buildTabTitles(BuildContext context) {
    // Builder to build Tab Title Item
    Widget _tabTitleItemBuilder(String lableText) => Tab(
          child: Text(
            "     $lableText     ",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        );

    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        _tabTitleItemBuilder(
          "Sign In",
        ),
        _tabTitleItemBuilder(
          "Sign Up",
        ),
      ],
    );
  }

  Widget _buildTabItems(BuildContext context) {
    return TabBarView(children: [
      SignInForm(),
      SignUpForm(),
    ]);
  }

  Widget _buildSocialLoginPanel(BuildContext context) {
    return Column(
      children: [
        Text(
          "Or use a social account to login",
          style: TextStyle(
            color: ColorPalette.textColorBrightDimmed,
          ),
        ),
        Expanded(
          child: Row(
            children: [],
          ),
        ),
      ],
    );
  }
}
