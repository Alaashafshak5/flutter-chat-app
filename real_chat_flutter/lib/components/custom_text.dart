import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  const CustomText({
    Key? key,
    this.fontSize = 14,
    this.color = Colors.white,
    required this.text,
    this.fontFamily = "ProximaNova",
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.letterSpacing = 0,
    this.underlined = false,
    this.underlinColor,
  }) : super(key: key);
  final double fontSize;
  final Color color;
  final String text;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double letterSpacing;
  final bool underlined;
  final Color? underlinColor;
  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
          fontSize: widget.fontSize,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
          color: widget.color,
          letterSpacing: widget.letterSpacing,
          decoration: widget.underlined ? TextDecoration.underline : null,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: widget.underlinColor ?? widget.color,
          decorationThickness: 5),
    );
  }
}
