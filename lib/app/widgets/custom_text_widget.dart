import 'package:flutter/material.dart';

class TextCustomStyle extends StatelessWidget {
  final double textSize;
  final String textData;
  final Color? textColor;
  final FontWeight textWeight;
  final String? fontFamily;
  final TextAlign? textAlign;

  const TextCustomStyle(
      {Key? key,
      required this.textData,
      required this.textSize,
      required this.textWeight,
      this.textColor,
      this.fontFamily,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      
      textData,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: textSize, fontWeight: textWeight, color: textColor,fontFamily:fontFamily,),
    );
  }
}
