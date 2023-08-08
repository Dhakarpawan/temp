import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final double mySize;
  final String myText;
  final Color myColor;
  final FontWeight myFontWeight;
  const LargeText(
      {super.key,
      required this.mySize,
      required this.myText,
      required this.myColor,
      required this.myFontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: TextStyle(
        color: myColor,
        fontSize: mySize,
        fontWeight: myFontWeight,
      ),
    );
  }
}