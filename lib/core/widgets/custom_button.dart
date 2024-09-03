import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.bgcolor,
    required this.text,
    this.borderRadius,
    required this.style,
  });
  final Color bgcolor;
  final String text;
  final BorderRadius? borderRadius;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15),
          ),
          backgroundColor: bgcolor,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}