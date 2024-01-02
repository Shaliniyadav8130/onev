import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  //final double width;
  final double height;
  final Widget child;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    Key? key,
    //required this.width,
    this.height = 50,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xffFFC20C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        fixedSize: Size.fromHeight(height),
      ),
      child: child,
    );
  }
}

