import 'package:flutter/material.dart';

class TextCustomStyle extends StatelessWidget {
  final double textSize;
  final String textData;
  final Color? textColor;
  final FontWeight textWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;


  const TextCustomStyle(
      {Key? key,
      required this.textData,
      required this.textSize,
      required this.textWeight,
      this.fontStyle,
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
        fontStyle: fontStyle,
          fontSize: textSize, fontWeight: textWeight, color: textColor,fontFamily:fontFamily,),
    );
  }
}
