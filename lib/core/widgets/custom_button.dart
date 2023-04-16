import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.SizeButton,
    this.onPressed,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final double? SizeButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeButton??40,
      child: TextButton(
        onPressed: onPressed,

        style: TextButton.styleFrom(

          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 1.0),
            // إضافة حدود سوداء بسمك 2 بكسل

            borderRadius: borderRadius ??
                BorderRadius.circular(
                  12,
                ),
          ),
        ),

        child: Text(
          text,
          maxLines: 1,
          style: Styles.textStyle14.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
