import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onTap,
    required this.text,
    required this.color,
    required this.textColor,
    this.width,
    this.height,
    this.fontSize,
  });
  final Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: width,
        height: height ?? 80,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize ?? 30),
          ),
        ),
      ),
    );
  }
}
