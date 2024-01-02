import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomHomeWidget extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;

  CustomHomeWidget({
    required this.imagePath,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Set your desired border radius
        border: Border.all(
          color: Color(0xffCBCBCB), // Set your desired border color
          width: 2, // Set your desired border width
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            child: SvgPicture.asset(imagePath),
          ),
          SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text1.text.bold.size(21).make(),
              Text(
                text2,
                style: TextStyle(fontSize: 10,color: Color(0xffFFC20C)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
