import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';
import 'package:login_app/resources/themes.dart';
import 'package:login_app/screens/login/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.primaryLightTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
