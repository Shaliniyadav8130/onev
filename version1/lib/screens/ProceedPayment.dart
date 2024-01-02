import 'package:flutter/material.dart';
import 'package:version1/utils/dimensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:version1/widgets/CustomSelectVehicle.dart';
import 'package:version1/widgets/ElevatedButtonWidget.dart';

class ProceedPayment extends StatefulWidget {
  const ProceedPayment({Key? key}) : super(key: key);

  @override
  State<ProceedPayment> createState() => _ProceedPaymentState();
}

class _ProceedPaymentState extends State<ProceedPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Vehicle",style: TextStyle(fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimensions.height30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0),
                ),
                border: Border(
                  top: BorderSide(
                    color: Color(0xffFFC20C),
                    width: 4.0,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top:Dimensions.height40,bottom: Dimensions.height40),
                child:GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 6, // Change this based on your requirement
                  itemBuilder: (context, index) {
                    return SelectVehicleWidget(); // Your custom item widget
                  },
                ),
              ),

            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
            child: Divider(),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pickup Contact"),
                Text("123456789 | Harsh",style: TextStyle(color: Color(0xffFFC20C)),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
            child: Divider(),
          ),

          Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Good Type"),
                  Text("Plywood | 58 pieces",style: TextStyle(color: Color(0xffFFC20C)),)
                ],
              ),
          ),

          SizedBox(height:Dimensions.height40),

          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom:Dimensions.height20,left:Dimensions.width30,right:Dimensions.width30),
                  child: CustomElevatedButton(
                    onPressed: () {},
                    child: const Text("Proceed to Payments",style: TextStyle(color: Colors.black),),
                  ),
                ),

              )
            ],
          ),
        ],
      ),
    );
  }
}

