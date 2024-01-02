import 'dart:async';
import 'package:dotted_line/dotted_line.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:version1/screens/LocationSearch.dart';
import 'package:version1/screens/ReceiversDetails.dart';
import 'package:version1/widgets/ElevatedButtonWidget.dart';
import 'package:version1/widgets/custom_page_route.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(28.667856, 77.449791),
    zoom: 15,
  );


  final TextEditingController pickup = TextEditingController();
  final TextEditingController midpoint = TextEditingController();
  final TextEditingController drop = TextEditingController();

  bool addStop=false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your pickup location",style: TextStyle(fontWeight: FontWeight.w700),),
      ),
          backgroundColor: Colors.white,

          body:Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(

                    padding: EdgeInsets.all(10),
                    height: context.screenHeight*.36,
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8), // Shadow color
                          spreadRadius: 20, // Spread radius of the shadow
                          blurRadius: 10, // Blur radius of the shadow
                          offset: Offset(0, 5), // Offset from the top left corner
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child:SvgPicture.asset(
                                  "assets/pickup.svg",
                                  width: 25,
                                  height: 25,
                                ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    final selectedLocation = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LocationSearch(),
                                      ),
                                    );

                                    if (selectedLocation != null) {
                                      setState(() {
                                        pickup.text = selectedLocation;
                                      });
                                    }
                                  },
                                  child: field(
                                    size,
                                    "Pickup location",
                                    Icons.location_searching_outlined,
                                    pickup,
                                        () async {
                                      final selectedLocation = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LocationSearch(),
                                        ),
                                      );

                                      if (selectedLocation != null) {
                                        setState(() {
                                          pickup.text = selectedLocation;
                                        });
                                      }
                                    },
                                  ),
                                )

                              ],
                            ),
                            Container(margin: EdgeInsets.symmetric(horizontal: 25),
                              height: 40,
                              width: 2,
                              child: DottedLine(
                                    direction: Axis.vertical,
                                    dashColor: Colors.black,
                                    lineThickness: 2,
                                  ),

                            ),
                          ],
                        ),
                        (addStop)?Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      addStop=false;
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    child: SvgPicture.asset(
                                  "assets/midpoint.svg",
                                  width: 25,
                                  height: 25,
                                ),
                                  ),
                                ),
                                field(size,
                                    "Add Midpoint",
                                    Icons.location_searching_outlined,
                                    midpoint,
                                      () async {
                                    final selectedLocation = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LocationSearch(),
                                      ),
                                    );

                                    if (selectedLocation != null) {
                                      setState(() {
                                        midpoint.text = selectedLocation;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Container(margin: EdgeInsets.symmetric(horizontal: 25),
                              height: 40,
                              width: 2,
                              child:DottedLine(
                                    direction: Axis.vertical,
                                    dashColor: Colors.black,
                                    lineThickness: 2,
                                  ),

                            ),
                          ],
                        ):SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child:SvgPicture.asset(
                                  "assets/dropLocation.svg",
                                  width: 25,
                                  height: 25,
                                ),
                                ),
                                field(size,
                                    "Drop location",
                                    Icons.location_searching_outlined,
                                    drop,
                                      () async {
                                    final selectedLocation = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LocationSearch(),
                                      ),
                                    );

                                    if (selectedLocation != null) {
                                      setState(() {
                                        drop.text = selectedLocation;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),

                          ],
                        ),
                        !addStop?Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Container(margin: EdgeInsets.symmetric(horizontal: 25),
                              height: 40,
                              width: 2,
                              child:DottedLine(
                                    direction: Axis.vertical,
                                    dashColor: Colors.black,
                                    lineThickness: 2,
                                  ),

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      addStop=true;
                                    });

                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                                    height: 20,
                                    width: 20,
                                    child:SvgPicture.asset(
                                  "assets/midpoint.svg",
                                  width: 25,
                                  height: 25,
                                ),
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ):SizedBox()
                      ],
                    ),
                  ),

            ),

          Positioned(
            bottom: 16,
            left: 25,
            right: 25,
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  CustomPageroute(
                    child: ReceiversDetails(),
                    direction: AxisDirection.left, // Change the direction as needed
                  ),
                );
              },
              child: const Text("Add location",style: TextStyle(color: Colors.black),),
            ),
          )
        ],
      ),
    );
  }
  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height / 15,
        width: size.width * .78,
        child: TextField(
          controller: cont,
          autofocus: false, // Set this to true if you want the field to be focused
          onTap: onTap, // This is not necessary but might be useful
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          style: TextStyle(
            overflow: TextOverflow.ellipsis, // Add this line
          ),
        ),
      ),
    );
  }

}