import 'package:flutter/material.dart';
import 'package:version1/screens/select_goods.dart';
import 'package:version1/utils/dimensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:version1/widgets/CustomSelectVehicle.dart';
import 'package:version1/widgets/ElevatedButtonWidget.dart';
import 'package:version1/widgets/custom_page_route.dart';

class SelectVehicle extends StatefulWidget {
  const SelectVehicle({Key? key}) : super(key: key);

  @override
  State<SelectVehicle> createState() => _SelectVehicleState();
}

class _SelectVehicleState extends State<SelectVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Vehicle",style: TextStyle(fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/pickup.svg",
                      width: Dimensions.height25,
                      height: Dimensions.height25,
                    ),
                    SizedBox(width: Dimensions.width10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Harsh | 123456789",
                            style: TextStyle(
                                fontSize: Dimensions.font18,
                                fontWeight: FontWeight.w400)),
                        Text("crossing republik",
                            style: TextStyle(fontSize: Dimensions.font12)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: SvgPicture.asset(
                        "assets/line.svg",
                        width: Dimensions.width6,
                        height: Dimensions.height48,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/dropLocation.svg",
                      width: Dimensions.height25,
                      height: Dimensions.height25,
                    ),
                    SizedBox(width: Dimensions.width10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Harsh | 123456789",
                            style: TextStyle(
                                fontSize: Dimensions.font18,
                                fontWeight: FontWeight.w400)),
                        Text("Chandni chowk, Delhi",
                            style: TextStyle(fontSize: Dimensions.font12)),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: Dimensions.height25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedButton(
                      height: Dimensions.height10,
                      onPressed: () {},
                      child: const Text(
                        "Add stop",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                    SizedBox(width: Dimensions.width10),
                    CustomElevatedButton(
                      height: Dimensions.height10,
                      onPressed: () {},
                      child: const Text(
                        "Edit Locations",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

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

          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom:Dimensions.height20,left:Dimensions.width30,right:Dimensions.width30),
                  child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CustomPageroute(
                          child: SelectGoodsScreen(),
                          direction: AxisDirection.left, // Change the direction as needed
                        ),
                      );
                    },
                    child: const Text("Select Good Types ",style: TextStyle(color: Colors.black),),
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

