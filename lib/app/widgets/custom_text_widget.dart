import 'package:flutter/material.dart';

class TextCustomStyle extends StatelessWidget {
  final textSize;
  final textData;
  final textColor;
  final textWeight;
  final fontFamily;
  TextCustomStyle(
      {Key? key,
      required this.textData,
      required this.textSize,
      required this.textWeight,
      this.textColor,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      
      textData,
      style: TextStyle(
          fontSize: textSize, fontWeight: textWeight, color: textColor,fontFamily:fontFamily),
    );
  }
}
