import 'package:flutter/material.dart';
import 'package:version1/screens/select_vehicle.dart';
import 'package:version1/utils/dimensions.dart';
import 'package:version1/widgets/ElevatedButtonWidget.dart';
import 'package:version1/widgets/TextFormFieldWidget.dart';
import 'package:version1/widgets/custom_container.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:version1/widgets/custom_page_route.dart';


class ReceiversDetails extends StatefulWidget {
  const ReceiversDetails({Key? key}) : super(key: key);

  @override
  State<ReceiversDetails> createState() => _ReceiversDetailsState();
}

class _ReceiversDetailsState extends State<ReceiversDetails> {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(28.667856, 77.449791),
    zoom: 15,
  );

  bool isChecked = false;
  final TextEditingController ReceiverName = TextEditingController();
  final TextEditingController ReceiverMobile = TextEditingController();
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    print("Current height is"+ MediaQuery.of(context).size.height.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: opacity,
              child:GoogleMap(
                initialCameraPosition: _initialPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),

          ),

          Positioned(
            top:40,
              left:20,
              child:
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // This line will navigate back to the previous screen
                },
                child:CustomContainer(
                width: 40.0,
                height: 40.0,
                borderRadius: 60.0,
                color: Color(0xffFFFFFF),
                child: Center(
                  child:Icon(Icons.arrow_back,),
                ),
              ),
            ),
          ),

          Positioned(
            bottom:0,
                left:0,
                right: 0,
                child:Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
                  child:
                  //controller: scrollController,
                  Container(
                    margin:  EdgeInsets.only(left: Dimensions.width35, right: Dimensions.width35, bottom: Dimensions.height20, top: Dimensions.height30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: Color(0xffFFC20C)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Chandni Chowk Delhi", style: TextStyle(fontSize: Dimensions.font18, fontWeight: FontWeight.bold)),
                                      Text("M-block near red fort, chandni chowl new delhi", style: TextStyle(fontSize: Dimensions.font12)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/editIcon.svg",
                              width: 25,
                              height: 25,
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions.height15),
                        TextFieldWidget(hintText: "Receiver's Name", controller: ReceiverName, borderColor: Color(0x33000000)),
                        SizedBox(height: Dimensions.height15),
                        TextFieldWidget(hintText: "Receiver's Mobile Number", controller: ReceiverMobile, borderColor: Color(0x33000000)),

                        SizedBox(height: Dimensions.height15),

                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.yellow,
                                    width: 2.0,
                                  ),
                                ),
                                width: Dimensions.width20,
                                height: Dimensions.height20,
                                child: isChecked
                                    ? const Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.black,
                                )
                                    : null,
                              ),
                            ),
                            SizedBox(width: Dimensions.width10),
                            const Text("Use my phone number: 123456789"),
                          ],
                        ),
                        SizedBox(height: Dimensions.height20),
                        const Text("Save as (Optional):"),

                        SizedBox(height: Dimensions.height15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomContainer(
                              width: Dimensions.width100,
                              height: Dimensions.height30,
                              borderRadius: 5.0,
                              child: Center(
                                child: Text("Home"),
                              ),
                            ),
                            SizedBox(width:Dimensions.width6),
                            CustomContainer(
                              width: Dimensions.width100,
                              height: Dimensions.height30,
                              borderRadius: 5.0,
                              child: Center(
                                child: Text("Shop"),
                              ),
                            ),
                            SizedBox(width:Dimensions.width6),
                            CustomContainer(
                              width: Dimensions.width100,
                              height: Dimensions.height30,
                              borderRadius: 5.0,
                              child: Center(
                                child: Text("Others"),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions.height20),

                        Row(
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    CustomPageroute(
                                      child: SelectVehicle(),
                                      direction: AxisDirection.left, // Change the direction as needed
                                    ),
                                  );
                                },
                                child: const Text("Confirm and Proceed",style: TextStyle(color: Colors.black),),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
          ),
        ],
      ),
    );
  }
}
