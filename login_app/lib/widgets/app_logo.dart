import 'package:flutter/material.dart';
import 'package:tf_responsive/tf_responsive.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(tfText(1)),
            child: Image.asset(
              'assets/images/insta_logo.png',
              width: tfImage(16),
              height: tfImage(16),
            ),
          ),
          SizedBox(width: tfWidth(3)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Instagram",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: tfText(4.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: tfHeight(0.3)),
              Text(
                "Your place for memes, news",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: tfText(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
