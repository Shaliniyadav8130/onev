import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:version1/widgets/custom_container.dart';


class SelectVehicleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Text(
              'Tata Ace',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            SvgPicture.asset(
              "assets/truck.svg",
              width: 70,
              height: 60,
            ),
            SizedBox(height: 10),
            Text(
              '20 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
            SizedBox(height:5),
            CustomContainer(
              width: 50,
              height: 25,
              borderRadius: 60,
              borderColor: Color(0xffFFC20C),
              color: Color(0xffFFC20C),
              child: Center(
                child: Text("1450"),
              ),

            )
          ],

    );
  }
}

