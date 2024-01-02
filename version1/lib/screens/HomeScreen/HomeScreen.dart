import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/svg.dart';
import 'package:version1/screens/Search_page.dart';
import 'package:version1/widgets/CustomHomeWidget.dart';
import 'package:version1/widgets/custom_page_route.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0),
            ),
          ),
          // You can customize the appearance of your bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              20.heightBox,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: "Choose Your Service".text.bold.black.size(21).make(),
              ),
              InkWell(

                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 100,
                  width: context.screenWidth*.9,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            color: Colors.red,
                          ),
                          "Open".text.size(18).make()

                        ],
                      ),
                      Icon(Icons.navigate_next,color: Colors.black,size: 35,)
                    ],
                  ),
                ).box.margin(EdgeInsets.all(10)).roundedLg.blue50.make(),
              ),
              10.heightBox,
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 100,
                  width: context.screenWidth*.9,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            color: Colors.red,
                          ),
                          "Open".text.size(18).make()

                        ],
                      ),
                      Icon(Icons.navigate_next,color: Colors.black,size: 35,)
                    ],
                  ),
                ).box.margin(EdgeInsets.all(10)).roundedLg.blue50.make(),
              ),
              20.heightBox
            ],
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height:60),
              Row(
                children: [
                  SizedBox(width:20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/Arrow.svg",
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width:4),
                          "Domino's Pizza".text.size(19).bold.make(),
                           InkWell(
                             onTap: (){
                               Navigator.of(context).push(
                                 CustomPageroute(
                                   child: SearchPage(),
                                   direction: AxisDirection.left, // Change the direction as needed
                                 ),
                               );
                             },
                               child:Icon(Icons.keyboard_arrow_down,color: Colors.black,)
                           ),
                          ],
                      ),
                      "P- Block crossing republik Ghaziabad".text.size(12).make(),
                    ],
                  )

                ],
              ),
              SizedBox(height:60),
              Row(
                children: [
                  SizedBox(width:20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hii",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                      Text("Harsh",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      Text("What are you sending today ?",style: TextStyle(fontSize: 17,)),
                      SizedBox(height:30),
                      Text("Select your Vehicle Category",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),

          InkWell(
                  onTap: (){
                    _showBottomSheet(context);
                    //
                  },
                  child:CustomHomeWidget(imagePath: "assets/Bike.svg",text1: "2 Wheeler",text2:"(for smaller goods)"),

                ),

              InkWell(
                onTap: (){
                  _showBottomSheet(context);
                  //
                },
                child:CustomHomeWidget(imagePath: "assets/Auto.svg",text1: "3 Wheeler",text2:"(for Bigger goods)"),

              ),

              InkWell(
                onTap: (){
                  _showBottomSheet(context);
                  //
                },
                child:CustomHomeWidget(imagePath: "assets/Trucks.svg",text1: "Trucks",text2:"(for Bigger goods)"),

              ),


              //SizedBox(height: 20,),

              // ListView(
              //   shrinkWrap: true,
              //   children: [
              //     InkWell(
              //       onTap: (){
              //         _showBottomSheet(context);
              //         //
              //       },
              //       child:CustomHomeWidget(imagePath: "assets/Bike.svg",text1: "2 Wheeler",text2: "(for smaller goods)",),
              //
              //     ),
              //
              //     InkWell(
              //       onTap: (){
              //         _showBottomSheet(context);
              //         //
              //       },
              //       child:CustomHomeWidget(imagePath: "assets/Bike.svg",text1: "3 Wheeler",text2:"(for Bigger goods)"),
              //
              //     ),
              //
              //     InkWell(
              //         onTap: (){
              //           _showBottomSheet(context);
              //           //
              //         },
              //         child:CustomHomeWidget(imagePath: "assets/Bike.svg",text1: "Truck",text2: "(for Bigger goods)",)
              //
              //     ),
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}