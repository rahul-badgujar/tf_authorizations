import 'package:flutter/material.dart';
import 'package:login_app/resources/colors.dart';
import 'package:login_app/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: ColorPalette.primarySwatch,
      ),
      home: const LoginScreen(),
    );
  }
}
