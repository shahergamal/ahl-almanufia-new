import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({
    @required this.customText,
    this.customsize,
    this.customcolor,
    this.customweight,
  });
  final String customText;
  final double customsize;
  final Color customcolor;
  final FontWeight customweight;
  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      style: TextStyle(
        fontSize: customsize,
        color: customcolor,
        fontWeight: customweight,
      ),
    );
  }
}
