// ignore: file_names
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsButton extends StatelessWidget {
  const CustomBookDetailsButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonFontSize,
    required this.buttonBorderRadius,
    required this.buttonTextColor,
    required this.onPressed,
  });

  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final double buttonFontSize;
  final BorderRadius buttonBorderRadius;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(borderRadius: buttonBorderRadius),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Styles.styleText18.copyWith(
            color: buttonTextColor,
            fontSize: buttonFontSize,
          ),
        ),
      ),
    );
  }
}
