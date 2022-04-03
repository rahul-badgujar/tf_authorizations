import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';
import 'package:login_app/screens/login/signin_form.dart';
import 'package:login_app/screens/login/signup_form.dart';
import 'package:login_app/widgets/app_logo.dart';
import 'package:tf_responsive/tf_responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: tfWidth(4)),
                child: Column(
                  children: [
                    SizedBox(height: tfHeight(5)),
                    const AppLogo(),
                    SizedBox(height: tfHeight(5)),
                    _buildAuthTabsContent(context),
                    _buildSocialLoginPanel(context),
                    SizedBox(height: tfHeight(5)),
                  ],
                ),
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
        SizedBox(height: tfHeight(4.2)),
        _buildTabItems(context),
      ],
    );
  }

  Widget _buildTabTitles(BuildContext context) {
    // Builder to build Tab Title Item
    Widget _tabTitleItemBuilder(String lableText) => Tab(
          child: Text(
            "     $lableText     ",
            style: TextStyle(
              fontSize: tfText(2.8),
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
    return Container(
      constraints: BoxConstraints(maxHeight: tfHeight(40)),
      child: TabBarView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: tfWidth(5)),
          child: SignInForm(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: tfWidth(5)),
          child: SignUpForm(),
        ),
      ]),
    );
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
        SizedBox(height: tfHeight(2)),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialLoginButton(
                iconAssetPath: 'assets/images/fb_logo.png',
                onPressed: () {},
              ),
              _buildSocialLoginButton(
                iconAssetPath: 'assets/images/insta_logo.png',
                onPressed: () {},
              ),
              _buildSocialLoginButton(
                iconAssetPath: 'assets/images/apple_logo.png',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButton(
      {required String iconAssetPath, required VoidCallback onPressed}) {
    return Padding(
      padding: EdgeInsets.all(tfImage(4)),
      child: GestureDetector(
        onTap: onPressed,
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: tfImage(6.5),
          child: Padding(
            padding: EdgeInsets.all(tfImage(3.4)),
            child: Image.asset(
              iconAssetPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
