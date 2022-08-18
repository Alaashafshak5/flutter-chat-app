import 'package:flutter/material.dart';
import '../defines/custom_color.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color = Colors.white,
    this.backgroundColor = CustomColor.green,
    this.fontSize = 14,
    this.borderRadius = 10,
    // this.height = 44,
    this.width = 160,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String title;
  final Color color;
  final Color backgroundColor;
  final double fontSize;
  final double borderRadius;
  // final double height;
  final double width;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
          style: OutlinedButton.styleFrom(
            // side: BorderSide(),
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
            backgroundColor: widget.backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.title.toUpperCase(),
            style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
