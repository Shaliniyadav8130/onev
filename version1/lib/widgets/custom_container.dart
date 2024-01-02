import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Color? color;
  final Widget? child;

  const CustomContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.borderColor = const Color(0xffD9D9D9),
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: 2.0, // Set your desired border width
        ),
      ),
      child: child,
    );
  }
}

